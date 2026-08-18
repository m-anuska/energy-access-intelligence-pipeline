import pandas as pd

def clean_data(filepath):
    df = pd.read_csv(filepath)
    df = df.drop_duplicates()
    df = df.dropna()
    return df

def get_inverter_performance(df):
    return df.groupby("SOURCE_KEY")["DAILY_YIELD"].mean().sort_values(ascending=False)

if __name__ == "__main__":
    df = clean_data("data/Plant_1_Generation_Data.csv")
    print("Total records after cleaning:", len(df))
    performance = get_inverter_performance(df)
    print("Top performing inverter:", performance.index[0])
    print("Lowest performing inverter:", performance.index[-1])
