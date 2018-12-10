# Calm Waters

### commit explanation

features

|        action        |       emoji       |
|:--------------------:|:-----------------:|
| adding something new | :heavy_plus_sign: |
|    fixing_a_bug      |      :bug:        |
|    new_issue         |       :x:         |
|    fix_issue         |    :ok_hand:      |


```
    all message - feature
```

example

```
    making a resource by hand in species :bug:
```

### Routes Explanation

|       Route                     |              Details                                 |
|:-------------------------------:|:----------------------------------------------------:|
| /users/sign_in                  | here you will login                                  |
| /tanks                          | you can see all tanks registered                     |
| /tanks/new                      | you can add a new tank                               |
| /                               | here you will see a resume of everything             |
| /foods/new                      | you can add a new food                               |
| /foods                          | you can see all foods registered                     |
| /food_types/new                 | you can add a new food types                         |
| /food_types                     | you can see all food types registered                |
| /food_species/new               | you can add a new food species                       |
| /food_species                   | you can see all food species registered              |
| /species/new                    | you can add a new species                            |
| /species                        | you can see all species registered                   |
| /monitoring_histories/new       | you can add a new anotations                         |
| /monitoring_histories           | you can see all anotations registered                |
| /ambiental_conditions/new       | you can add a new ambiental conditions               |
| /ambiental_conditions           | you can see all ambiental conditions registered      |
| /dados_diarios                  | you can insert diary data by a api params            |

### how to use API

Sending

```
    POST https://aguas-tranquilas.herokuapp.com/dados_diarios
```

Params

|       params                     |              Details                                 |
|:--------------------------------:|:----------------------------------------------------:|
| id                               | ID of tank that you will update                      |
| acidity                          | current acidity of the day in the tank               |
| temperature                      | current temperature of the day in the tank           |
| oxigen                           | current oxigen of the day in the tank                |
| ammonia                          | current ammonia of the day in the tank               |
| ph                               | current ph of the day in the tank                    |


Example

|       params                     |   Details      |
|:--------------------------------:|:--------------:|
| id                               | 1   |
| acidity                          | 11  |
| temperature                      | 25  |
| oxigen                           | 12  |
| ammonia                          | 50  |
| ph                               | 110 |