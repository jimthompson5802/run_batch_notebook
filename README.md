# Run notebook in batch
Demonstrate running a jupyter notebook in batch mode using the `jupyter nbconvert` command. Arguments on the `nbconvert` command:
* `--to script` converts the notebook to native python code
* `--stdout` writes the converted python code to `stdout`

The converted python code written to `stdout` is piped to the `python` interpreter that reads the program from `stdin`.

When running in batch mode, parameters required by the notebook are passed in as command line arguments.

## Contents
* `data/` synthetic data used for this example
* `generate_data_sets.ipynb` notebook to generate synthetic data
* `train_model.ipynb` notebook for analyzing data and train an ml model

## Run `train_model.ipynb` notebook in batch mode
```
jupyter nbconvert --to script --stdout train_model.ipynb | python - --training_fp ./data/train_13.csv --model_dir ./models/model_13 --plot_dir ./plots/plot_13
jupyter nbconvert --to script --stdout train_model.ipynb | python - --training_fp ./data/train_23.csv --model_dir ./models/model_23 --plot_dir ./plots/plot_23
jupyter nbconvert --to script --stdout train_model.ipynb | python - --training_fp ./data/train_42.csv --model_dir ./models/model_42 --plot_dir ./plots/plot_42
```

## Notebook coding considerations
* Notebook magics are not supported in code conversion.  Any magics must be commented out or removed from the notebook.
* If plots are generated during the batch run, these must be saved to disk storage.

