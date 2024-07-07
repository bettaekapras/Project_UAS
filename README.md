# Project_UAS_Mobile2

| Anggota Kelompok                |
| ------------------------------- |
| BETTA EKA PRASETYA (312210437)  |
| MILA RISPA MAOLIDAH (312210249) |

## Tampilan

https://github.com/bettaekapras/Project_UAS_Mobile2/assets/169062721/2d0ebfbb-0aa5-4920-9cd0-d47ba3f6f52a

# Getting Started

This repository contains the dataset and sample code for the [Getting Started](https://www.pilosa.com/docs/getting-started/) section of [Pilosa documentation](https://www.pilosa.com/docs/introduction/).

## The Dataset

The sample dataset contains stargazer and language data for Github projects which were retrieved for the search keyword "Go". See the _Generating the Dataset_ section below to create other datasets.

- `languages.txt`: Language name to languageID mapping. The line number corresponds to the languageID.
- `language.csv`: languageID, projectID
- `stargazer.csv`: stargazerID, projectID, timestamp(starred)

## Usage

### Docker

Run the Pilosa Docker image with Getting Started data using:

```
docker run -it --rm -p 10101:10101 pilosa/getting-started:latest
```

Continue with [Getting Started: Make Some Queries](https://www.pilosa.com/docs/latest/getting-started/#make-some-queries).

### Without Docker

1. Pilosa server should be running: [Starting Pilosa](https://www.pilosa.com/docs/getting-started/#starting-pilosa)
2. The appropriate schema should be initialized: [Create the Schema](https://www.pilosa.com/docs/getting-started/#create-the-schema)
3. Finally, the data can be imported: [Import Some Data](https://www.pilosa.com/docs/getting-started/#import-some-data)

Continue with [Getting Started: Make Some Queries](https://www.pilosa.com/docs/latest/getting-started/#make-some-queries).

## Sample Projects

- [Go](https://github.com/pilosa/getting-started/tree/master/go)
- [Java](https://github.com/pilosa/getting-started/tree/master/java)
- [Python](https://github.com/pilosa/getting-started/tree/master/python)

## Generating the Dataset

Using a Github token is strongly recommended for avoiding throttling. If you don't already have a token for the [GitHub API](https://developer.github.com/v3/), see [Creating a personal access token for the command line](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/).

A recent version of Python is required. We test the script with 2.7 and 3.5.

Below are the steps to run commands:

1. Create a virtual env:
   - Using Python 2.7: `virtualenv getting-started`
   - Using Python 3.5: `python3 -m venv getting-started`
2. Activate the virtual env:
   - On Linux, MacOS, other UNIX: `source getting-started/bin/activate`
   - On Windows: `getting-started\Scripts\activate`
3. Install requirements: `pip install -r requirements.txt`
4. If you have a Github token, save it as `token` in the root directory of the project.

#### To generate csv files:

The `fetch.py` script searches Github for a given keyword and creates the dataset explained in _The Dataset_ section.

Run the script: `python fetch.py KEYWORD`.
`KEYWORD` is the search term to use for searching repository names.
