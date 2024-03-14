const express = require('express')
const router = express.Router()
const utils = require('../utils/index.js')
const { primary } = require('../utils/roleString')
const pools = require('../utils/pools.js')
const xlsx = require('node-xlsx')
const path = require('path')
const fileEvent = require('../utils/file')

// 新增商品类别
router.post('/addCategory', async (req, res) => {
  let sql = 'INSERT INTO product_category (category_name, status, remarks) VALUES (?,?,?)',
    obj = req.body
  await pools({ sql, val: [obj.name, obj.status, obj.remarks], run: false, res, req })
  //将信息响应给前端
  res.send(utils.returnData({ data: { res: '添加类别成功！', req } }))
})

// 查询商品类别
router.post('/getCategory', async (req, res) => {
  let obj = req.body
  let sql = `SELECT id,status,remarks,category_name AS name,update_time AS updateTime,create_time AS createTime FROM product_category WHERE 1=1 `
  sql = utils.setLike(sql, 'category_name', obj.name)
  //将信息响应给前端
  let { total } = await utils.getSum({ sql, name: 'product_category', res, req })
  sql += ` ORDER BY id DESC`
  sql = utils.pageSize(sql, obj.page, obj.size)
  let { result } = await pools({ sql, res, req })
  res.send(utils.returnData({ data: result, total }))
})

// 修改商品类别
router.post('/upCategory', async (req, res) => {
  let sql = 'UPDATE product_category SET category_name=?,status=?,remarks=? WHERE id=?',
    obj = req.body
  await pools({ sql, val: [obj.name, obj.status, obj.remarks, obj.id], run: false, res, req })
  res.send(utils.returnData({ data: { res: '修改类别成功！', req } }))
})

//删除商品类别
router.post('/delCategory', async (req, res) => {
  let sql = 'DELETE FROM product_category WHERE id=?',
    obj = req.body
  await pools({ sql, val: [obj.id], run: false, res, req })
})

// 新增商品信息
router.post('/addGoods', async (req, res) => {
  const { name, url, price, sellAmount, inventory, favorites, address, categoryId } = req.body
  let sql =
    'INSERT INTO product_info (name, url, sellAmount, inventory, favorites, address, category_id) VALUES (?,?,?,?,?,?,?,?)'
  await pools({
    sql,
    val: [name, url, sellAmount, price, inventory, favorites, address, categoryId],
    run: false,
    res,
    req,
  })
  //将信息响应给前端
  res.send(utils.returnData({ data: { res: '添加类别成功！', req } }))
})

// 查询商品信息
router.post('/getGoods', async (req, res) => {
  let obj = req.body
  let sql = `SELECT id, name, url, price, sellAmount, inventory, favorites, address, category_id AS categoryId, update_time AS updateTime,create_time AS createTime FROM product_info WHERE 1=1 `
  if (obj.minPrice && obj.maxPrice) {
    sql += ` AND price >= ${minPrice} AND price <= ${maxPrice}`
  } else if (obj.minPrice) {
    sql += ` AND price >= ${minPrice}`
  } else if (obj.maxPrice) {
    sql += ` AND price <= ${maxPrice}`
  }
  if (obj.minInventory && obj.maxInventory) {
    sql += ` AND inventory >= ${minInventory} AND inventory <= ${maxInventory}`
  } else if (obj.minInventory) {
    sql += ` AND inventory >= ${minInventory}`
  } else if (obj.maxInventory) {
    sql += ` AND inventory <= ${maxInventory}`
  }
  if (obj.minFavorites && obj.maxFavorites) {
    sql += ` AND favorites >= ${minFavorites} AND favorites <= ${maxFavorites}`
  } else if (obj.minFavorites) {
    sql += ` AND favorites >= ${minFavorites}`
  } else if (obj.maxFavorites) {
    sql += ` AND favorites <= ${maxFavorites}`
  }
  if (obj.minSellAmount && obj.maxSellAmount) {
    sql += ` AND sellAmount >= ${minSellAmount} AND sellAmount <= ${maxSellAmount}`
  } else if (obj.minSellAmount) {
    sql += ` AND sellAmount >= ${minSellAmount}`
  } else if (obj.maxSellAmount) {
    sql += ` AND sellAmount <= ${maxSellAmount}`
  }
  sql = utils.setLike(sql, 'name', obj.name)
  sql = utils.setLike(sql, 'address', obj.address)
  //将信息响应给前端
  let { total } = await utils.getSum({ sql, name: 'product_info', res, req })
  sql += ` ORDER BY id DESC`
  sql = utils.pageSize(sql, obj.page, obj.size)
  let { result } = await pools({ sql, res, req })
  res.send(utils.returnData({ data: result, total }))
})

// 修改商品信息
router.post('/upGoods', async (req, res) => {
  const { name, url, price, sellAmount, inventory, favorites, address, categoryId, id } = req.body
  let sql =
    'UPDATE product_info SET name=?,url=?,price=?,sellAmount=?, inventory=?,favorites=?,address=?,category_id=? WHERE id=?'
  await pools({
    sql,
    val: [name, url, price, sellAmount, inventory, favorites, address, categoryId, id],
    run: false,
    res,
    req,
  })
  res.send(utils.returnData({ data: { res: '修改类别成功！', req } }))
})

//删除商品信息
router.post('/delGoods', async (req, res) => {
  const { id } = req.body
  let sql = 'DELETE FROM product_info WHERE id=?'
  await pools({ sql, val: [id], run: false, res, req })
})

module.exports = router
