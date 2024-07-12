import requests
import re
import json
import urllib.parse
import pandas as pd



def fetch_latest_hash():
    url = "https://web.joongna.com/"
    try:
        response = requests.get(url)
        response.raise_for_status()
        match = re.search(r"/_next/static/([^/]+)/_ssgManifest\.js", response.text)
        if match:
            return match.group(1)
        else:
            print("해시 값을 찾을 수 없습니다.")
            return None
    except requests.RequestException as e:
        print(f"요청 중 오류 발생: {e}")
        return None


def fetch_product_description(product_seq, hash_value):
    product_url = (
        f"https://web.joongna.com/_next/data/{hash_value}/product/{product_seq}.json"
    )
    try:
        response = requests.get(product_url)
        response.raise_for_status()
        data = response.json()
        product_description = data["pageProps"]["dehydratedState"]["queries"][0][
            "state"
        ]["data"]["data"].get("productDescription")
        return product_description
    except requests.RequestException as e:
        print(f"요청 중 오류 발생: {e}")
    except KeyError as e:
        print(f"JSON 구조에서 키를 찾을 수 없음: {e}")
    except json.JSONDecodeError as e:
        print(f"JSON 디코딩 중 오류 발생: {e}")
    return None


def fetch_joongna_data(keyword, page=1, category=1151):
    latest_hash = fetch_latest_hash()
    if not latest_hash:
        return None

    base_url = f"https://web.joongna.com/_next/data/{latest_hash}/search/"
    encoded_keyword = urllib.parse.quote(keyword)
    url = f"{base_url}{encoded_keyword}.json?keyword={encoded_keyword}&page={page}&category={category}"

    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
        items = data["pageProps"]["dehydratedState"]["queries"][1]["state"]["data"][
            "data"
        ].get("items", [])

        for item in items:
            product_seq = item.get("seq", None)
            if product_seq:
                product_description = fetch_product_description(
                    product_seq, latest_hash
                )
                item["productDescription"] = product_description

        return items
    except requests.RequestException as e:
        print(f"요청 중 오류 발생: {e}")
    except KeyError as e:
        print(f"JSON 구조에서 키를 찾을 수 없음: {e}")
    except json.JSONDecodeError as e:
        print(f"JSON 디코딩 중 오류 발생: {e}")
    return None


def main():
    keyword = "아이폰14프로"
    page = 1
    category = 1151

    items = fetch_joongna_data(keyword, page, category)
    if items:
        df = pd.DataFrame(items)
        print(df.columns)
        columns = [
            "seq",
            "price",
            "url",
            "title",
            "sortDate",
            "locationNames",
            "productDescription",
        ]
        df = df[columns]
        df = df.dropna(subset=["locationNames"])
        # locationNames 빈 리스트인 경우 삭제
        df = df[df["locationNames"].map(len) > 0]
        # locationNames 컬럼에서 첫번째 값만 선택
        df["locationNames"] = df["locationNames"].apply(lambda x: x[0])
        # sortDate 컬럼에서 값 없으면 삭제
        df = df.dropna(subset=['sortDate'])
        # sortDate 컬럼에서 datetime 형식으로 변환
        df["sortDate"] = pd.to_datetime(df["sortDate"])
        # time_delta 컬럼 추가
        df["time_delta"] = pd.Timestamp.now() - df["sortDate"]
        # 제거할 키워드
        df = df[~df['title'].str.contains('교환')]
        df = df[~df['title'].str.contains('매입')]
        df = df[~df['title'].str.contains('삽니다')]
        df = df[~df['title'].str.contains('구합니다')]
        df = df[~df['title'].str.contains('도매')]
        df = df[~df['title'].str.contains('대량')]
        df = df[~df['title'].str.contains('대여')]
        df = df[~df['title'].str.contains('정리')]
        df = df[~df['title'].str.contains('수리')]
        df = df[~df['title'].str.contains('공시')]

        print(df.columns)
        # ['seq', 'price', 'url', 'title', 'sortDate', 'locationNames',
        #'productDescription', 'time_delta']
        df.columns = [
            "PID",
            "PRICE",
            "PRODUCT_IMAGE",
            "NAME",
            "DATE",
            "LOCATION",
            "DESCRIPTION",
            "DELTA_TIME",
        ]
        print(df.columns)
        df.to_csv(
            "joongna_data_with_description.csv", index=False, encoding="utf-8-sig"
        )
    else:
        print("데이터를 가져오지 못했습니다.")


if __name__ == "__main__":
    main()
