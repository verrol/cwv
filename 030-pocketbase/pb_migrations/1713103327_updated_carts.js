/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("t6x1jklzqf4kt43")

  collection.listRule = "@request.auth.id = user"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("t6x1jklzqf4kt43")

  collection.listRule = "@request.auth.verified = true"

  return dao.saveCollection(collection)
})
