# Rupturing Randomness

A small util to display probabilities of dice pools with "exploding die".

## Usage

### Standard

    ./bin/rr 2 3 -e 1 -p
    [2, 1/6], [4, 1/12], [5, 2/9], [3, 1/6], [6, 5/36], [7, 1/12], [8, 1/18], [9, 1/18], [10, 1/36]

### Pretty printing 

    ./bin/rr 2 3 -e 1 -p
       2 (   1/    6) [*************                                                                   ]
       4 (   1/   12) [******                                                                          ]
       5 (   2/    9) [*****************                                                               ]
       3 (   1/    6) [*************                                                                   ]
       6 (   5/   36) [***********                                                                     ]
       7 (   1/   12) [******                                                                          ]
       8 (   1/   18) [****                                                                            ]
       9 (   1/   18) [****                                                                            ]
      10 (   1/   36) [**                                                                              ]

## Development

To run tests, run `rake`.
