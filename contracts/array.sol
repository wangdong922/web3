// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Arrays {
    uint[] public data;// 存储在storage中的动态数组
    // 将memory中的数组内容复制到storage中的data数组
    function updateData(uint[] memory newData) public {
        data = newData;
    }
    // 返回storage中的data数组
    function getData() public view returns(uint[] memory) {
        return data;
    }
    // 修改storage中的data数组中指定索引位置的值
    function modifyStorageData(uint index, uint value) public {
        require(index < data.length, "Index out of bounds");
        data[index] = value; // 修改storage中的值，开销较大
    }
    // 尝试修改传入的memory数组，并返回修改后的数组
    function modifyMemoryData(uint[] memory memData) public pure returns(uint[] memory) {
        if (memData.length > 0) {
            memData[0] = 999;
        }
        return memData;
    }

}