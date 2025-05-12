<template>
  <div>
    <div class="search" v-if="user.role === 'ADMIN'">
      <el-input placeholder="请输入费用说明" style="width: 200px" v-model="content"></el-input>
      <el-button type="info" plain style="margin-left: 10px" @click="load(1)">查询</el-button>
      <el-button type="warning" plain style="margin-left: 10px" @click="reset">重置</el-button>
    </div>

    <div class="operation" v-if="user.role === 'ADMIN'">
      <el-button type="primary" plain @click="handleAdd">新增</el-button>
      <el-button type="danger" plain @click="delBatch">批量删除</el-button>
    </div>

    <div class="table">
      <el-table :data="tableData" stripe  @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"></el-table-column>
        <el-table-column prop="id" label="序号" width="80" align="center" sortable></el-table-column>
        <el-table-column prop="dormitoryName" label="寝室" show-overflow-tooltip></el-table-column>
        <el-table-column prop="price" label="费用" show-overflow-tooltip></el-table-column>
        <el-table-column prop="content" label="费用说明" show-overflow-tooltip></el-table-column>
        <el-table-column prop="status" label="缴费状态">
          <template v-slot="scope">
            <el-tag type="success" v-if="scope.row.status === '已缴费'">{{scope.row.status}}</el-tag>
            <el-tag type="danger" v-else>{{scope.row.status}}</el-tag>
          </template>
        </el-table-column>

        <el-table-column label="操作" width="180" align="center" v-if="user.role === 'ADMIN'">
          <template v-slot="scope">
            <el-button plain type="primary" @click="handleEdit(scope.row)" size="mini">编辑</el-button>
            <el-button plain type="danger" size="mini" @click=del(scope.row.id)>删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination">
        <el-pagination
            background
            @current-change="handleCurrentChange"
            :current-page="pageNum"
            :page-sizes="[5, 10, 20]"
            :page-size="pageSize"
            layout="total, prev, pager, next"
            :total="total">
        </el-pagination>
      </div>
    </div>



