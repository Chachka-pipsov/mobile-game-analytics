import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import PercentFormatter
plt.figure(figsize=(10, 6))
plt.gca().yaxis.set_major_formatter(PercentFormatter(1))
df = pd.read_csv("retention.csv")
plt.plot(
    df["days_after_registration"],
    df["retention"],
    marker="o"
)
plt.xlabel("Days after registration")
plt.ylabel("Retention")
plt.title("Retention Curve")
plt.grid(alpha=0.3)
plt.savefig('retention_curve.png', dpi = 300)
plt.show()
