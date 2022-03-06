import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt


pitcher_data = pd.read_csv("/Users/mannyb/Documents/Baseball Projects/Stolen Base Project/maxscherzer.csv")
pitcher_data["count"] = pitcher_data["balls"].astype(str)+" - " + pitcher_data["strikes"].astype(str)
pitcher_data = pitcher_data.dropna()
plt.hist(pitcher_data["zone_"])
plt.xlabel("Zone")
plt.ylabel("Count")
plt.title("Number of Pitches per Zone")
zone_values = pitcher_data["zone_"].value_counts()
zone_percent = zone_values/zone_values.sum()
pitch_values = pitcher_data["pitch_type"].value_counts()
pitch_percent = pitch_values/pitch_values.sum()
count_values = pitcher_data["count"].value_counts()
count_percent = count_values/count_values.sum()

pitch_breakdown = pitcher_data.groupby(['count','pitch_type'],as_index = False).size().pivot('count','pitch_type').fillna(0)
zone_breakdown = pitcher_data.groupby(['pitch_type','zone_'],as_index = False).size().pivot('pitch_type','zone_').fillna(0)

balls_strikes = pitcher_data.groupby("type_")

colors = {'B':'blue', 'S':'red', 'X':'black'}

plt.figure()
for name, group in balls_strikes:
    plt.plot(group["plate_x"], group["plate_z"], marker="o", linestyle="", label=name, color=colors[name])
plt.grid()
plt.legend()
plt.xlabel("Horizontal Location")
plt.ylabel("Vertical Location")
plt.title("Pitch Location after Stolen Base")
plt.show()