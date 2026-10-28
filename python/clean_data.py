import pandas as pd
# wait_header = pd.read_csv("data/cihi_ed_data.csv", nrows = 0).columns.tolist()
# print("Patients waiting heads", wait_header)

# total_rows = 0
# for chunk in pd.read_csv("data/cihi_ed_data.csv", chunksize=10000):
#     total_rows += len(chunk)
# print("Total Rows", total_rows)

# to fix the problem of garbled text of hospital name and hyphen between years
df = pd.read_csv("data/cihi_ed_data.csv", encoding='utf8')
df.to_csv("data/cihi_ed_data_utf16.csv", encoding='utf-16', index=False)
print('Create a a utf16 csv')
