# -*- coding: utf-8 -*-


from sklearn.tree import DecisionTreeClassifier
from warnings import WarningMessage
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report
from sklearn.linear_model import LogisticRegression
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
import seaborn as sns
from sklearn.preprocessing import MinMaxScaler
import pandas as pd
import os
from google.colab import drive
drive.mount('/content/drive')

"""Changing directory"""

directory = "/content/drive/MyDrive/Spring22/CSE422 Lab"
os.chdir(directory)

"""Making DataFrame"""

wine_dataframe = pd.read_csv('wine.csv')
wine_dataframe

"""Checking number of rows and columns by calling shape"""

wine_dataframe.shape

wine_dataframe.shape[0]

wine_dataframe.shape[1]

"""Showing first 2 rowns"""

wine_dataframe.head(2)

"""Showing a random row from the dataset"""

wine_dataframe.sample()

"""Showing all the column names"""

wine_dataframe.columns

"""Checking null values"""

wine_dataframe.isnull()

"""Checking how many null values are there for each column and found that there is no missing values"""

wine_dataframe.isnull().sum()

"""Checking overall information of the dataset"""

wine_dataframe.info()

"""Only categorical feature is 'quality' and so encoding it"""

wine_dataframe['quality'].unique()

wine_dataframe['quality'] = wine_dataframe['quality'].map(
    {'good': 1, 'bad': 0})
print(wine_dataframe[['quality']].head())

"""Scaling the values if they are not in between 0-1"""

need_to_scale = []
for i in wine_dataframe:
    maximum = max(wine_dataframe[i])
    minimum = min(wine_dataframe[i])
    if minimum < 0 or maximum > 1:
        need_to_scale.append(i)

scaler = MinMaxScaler()
for i in need_to_scale:
    scaler.fit(wine_dataframe[[i]])
    wine_dataframe[i] = scaler.transform(wine_dataframe[[i]])
wine_dataframe

"""Dropping unimportant features or selecting only one of the features that produce the same benifit by observing the correlation heatmap"""

for_cor = wine_dataframe.corr()
sns.heatmap(for_cor, cmap="Blues", fmt='.1f', annot=True)

# Dropping irrelevant features
drop_columns = ['citric acid', 'chlorides',
                'total sulfur dioxide', 'density', 'pH', 'sulphates']
wine_dataframe = wine_dataframe.drop(drop_columns, axis=1)

"""Splitting the dataset into features and label and also splitting the train, test data"""


list_of_features = list(wine_dataframe.columns)[:-1]
print(list_of_features)
x_data = wine_dataframe[list_of_features]
y_data = wine_dataframe['quality']

x_train, x_test, y_train, y_test = train_test_split(
    x_data, y_data, test_size=0.2, random_state=1)

# Import the dependencies for logistic regression

# Train the model
model = LogisticRegression()
model.fit(x_train, y_train)  # Training the model
predictions = model.predict(x_test)
print(predictions)  # printing predictions

logistic_regression_accuracy = accuracy_score(y_test, predictions)
print(logistic_regression_accuracy)

clf = DecisionTreeClassifier(criterion='entropy', random_state=1)
clf.fit(x_train, y_train)
y_pred = clf.predict(x_test)
score = accuracy_score(y_pred, y_test)
print(score)

fig = plt.figure()
ax = fig.add_axes([0, 0, 0.5, 1])
langs = ["Logistic Regression", "Decision Tree"]
students = [logistic_regression_accuracy, score]
ax.bar(langs, students)
plt.show()