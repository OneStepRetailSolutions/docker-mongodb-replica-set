rsconf = {
  _id : "rs0",
  members: [
      {
          "_id": 0,
          "host": "mongo1:27011",
          "priority": 3
      },
      {
          "_id": 1,
          "host": "mongo2:27012",
          "priority": 2
      },
      {
          "_id": 2,
          "host": "mongo3:27013",
          "priority": 1
      }
  ]
}

rs.initiate(rsconf);
