import request from "@/utils/axios";

// 商品类型
export function addCategory(data) {
  return request({
    path: "/product/addCategory",
    data,
  });
}

export function getCategory(data) {
  return request({
    path: "/product/getCategory",
    data,
  });
}

export function upCategory(data) {
  return request({
    path: "/product/upCategory",
    data,
  });
}

export function delCategory(data) {
  return request({
    path: "/product/delCategory",
    data,
  });
}

// 商品信息
export function addGoods(data) {
  return request({
    path: "/product/addGoods",
    data,
  });
}

export function getGoods(data) {
  return request({
    path: "/product/getGoods",
    data,
  });
}

export function upGoods(data) {
  return request({
    path: "/product/upGoods",
    data,
  });
}

export function delGoods(data) {
  return request({
    path: "/product/delGoods",
    data,
  });
}
