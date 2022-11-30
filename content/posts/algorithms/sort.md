---
title: "排序算法"
date: 2021-03-03T22:35:34+08:00
draft: true
toc: false
images:
tags:
  - 算法
  - 排序
---

## 冒泡排序
```cpp
#include <bits/stdc++.h>
using namespace std;

void bubblesort(vector<int>& nums){
    int n = nums.size();

    for(int i = n - 1;i > 0;i--){
        for(int j = 0;j < i;j++){
            if(nums[j] > nums[j+1])
                swap(nums[j], nums[j+1]);
        }
    }
}

int main(){
    vector<int> nums(10);
    srand(unsigned(time(0)));
    // srand((unsigned)time(NULL)) 也可以
    for(int i = 0;i < 10;i++){
        nums[i] = rand() % 20;
        cout<<nums[i]<<" ";
    }
    cout<<endl;
    bubblesort(nums);
    
    for(auto x : nums) cout<<x<<" ";
    cout<<endl;
    return 0;
}
```

## 选择排序
```cpp
#include <bits/stdc++.h>
using namespace std;

void selectsort(vector<int>& nums){
    
    for(int i = 0;i < nums.size() - 1;i++){
        int min = i;
        for(int j = i + 1;j < nums.size();j++){
            if(nums[j] < nums[min])
                min = j;
        }
        swap(nums[min], nums[i]);
    }
}


int main(){
    vector<int> nums(10);
    srand(unsigned(time(0)));
    
    for(int i = 0;i < 10;i++){
        nums[i] = rand() % 20;
        cout<<nums[i]<<" ";
    }
    cout<<endl;
    selectsort(nums);
    
    for(auto x : nums) cout<<x<<" ";
    cout<<endl;
    return 0;
}
```

## 插入排序
```cpp
#include <bits/stdc++.h>
using namespace std;

void insertsort(vector<int>& nums){
    for(int i = 1;i < nums.size();i++){
        int t = nums[i], j;
        for(j = i -1 ;j >= 0;j--){
            if(nums[j] > t){
                nums[j+1] = nums[j];
                
            }else{
                break;
            }
        }
        nums[j + 1] = t;
    }
}

int main(){
    vector<int> nums(10);
    srand(unsigned(time(0)));
    
    for(int i = 0;i < 10;i++){
        nums[i] = rand() % 20;
        cout<<nums[i]<<" ";
    }
    cout<<endl;
    insertsort(nums);
    
    for(auto x : nums) cout<<x<<" ";
    cout<<endl;
    return 0;
}
```


## 希尔排序
```cpp
#include <bits/stdc++.h>
using namespace std;


void shellsort(vector<int>& nums) {
    int length = nums.size();
    int h = 1;
    while (h < length / 3) {
        h = 3 * h + 1;
    }
    int cnt = 0;
    while (h >= 1) {
        // 希尔排序大的关键就是每次一个节点都向前移动h步长，这样可以更快的接近自己的目标位置，从而获得较好的时间复杂度
        // 这里的i是[h...end], h是[j, i]
        for (int i = h; i < length; i++) {
            cout<<h<<" "<<i<<" "<<endl;
            for (int j = i; j >= h && nums[j] < nums[j - h]; j -= h) {
                //cout<<j<<" "<<j-h<<endl;
                cnt++;
                swap(nums[j], nums[j-h]);
            }
        }
        h = h / 3;
    }
    cout<<"Time O(";
    cout<<((double)cnt / length )<<")"<<endl;
}

int main(){
    const int n = 100;
    vector<int> nums(n);
    srand(unsigned(time(0)));
    
    for(int i = 0;i < n;i++){
        nums[i] = rand() % 20;
        cout<<nums[i]<<" ";
    }
    cout<<endl;
    shellsort(nums);
    
    for(auto x : nums) cout<<x<<" ";
    cout<<endl;
    return 0;
}
```

## 归并排序
```cpp
#include <bits/stdc++.h>
using namespace std;
const int n  = 10;
int aux[n];

void merge(vector<int>& nums, int left, int mid, int right){
    int i = left, j = mid + 1;

    for(int k = left;k <= right;k++) aux[k] = nums[k];

    for(int k = left;k <= right;k++){
        if(i > mid) nums[k] = aux[j++];
        else if(j > right) nums[k] = aux[i++]; // 互斥关系，必须使用else if
        else if(aux[i] > aux[j]) nums[k] = aux[j++];
        else nums[k] = aux[i++];
    }
}

void mergesort(vector<int>& nums, int left, int right){
    if(left >= right) return ;
    int mid = (right - left) / 2 + left;
    mergesort(nums, left, mid);
    mergesort(nums, mid + 1, right);
    merge(nums, left, mid, right);
}

int main(){

    vector<int> nums(n);
    srand(unsigned(time(0)));
    
    for(int i = 0;i < n;i++){
        nums[i] = rand() % 20;
        cout<<nums[i]<<" ";
    }
    cout<<endl;
    mergesort(nums, 0, nums.size() - 1);
    
    for(auto x : nums) cout<<x<<" ";
    cout<<endl;
    return 0;
}
```

## 快速排序
```cpp
#include <bits/stdc++.h>
using namespace std;

const int n = 10;
int partition(vector<int>& nums, int left, int right){
    int pivot = left;

    int i = left;
    int j = right + 1;

    while(true){
        while(nums[++i] < nums[pivot]) if(i == right) break;
        while(nums[--j] > nums[pivot]) if(j == left) break;
        if(i >= j) break;
        swap(nums[i], nums[j]);
    }
    swap(nums[pivot], nums[j]);
    return j;
}

void quicksort(vector<int>& nums, int left, int right){
    if(left >= right) return ;
    
    int j = partition(nums, left, right);
    quicksort(nums, left, j-1);
    quicksort(nums, j+1, right);
}   

int main(){

    vector<int> nums(n);
    srand(unsigned(time(0)));
    
    for(int i = 0;i < n;i++){
        nums[i] = rand() % 20;
        cout<<nums[i]<<" ";
    }
    cout<<endl;
    quicksort(nums, 0, nums.size() - 1);
    
    for(auto x : nums) cout<<x<<" ";
    cout<<endl;
    return 0;
}
```

## 堆排序
```cpp
#include <bits/stdc++.h>
using namespace std;

void heapify(vector<int>& nums, int left, int right){
    int dad = left;
    int son = dad * 2 + 1;

    while(son <= right){
        if(son + 1 <= right && nums[son + 1] > nums[son]){
            son = son + 1;
        }
        if(nums[dad] > nums[son]){
            return ;
        }else{
            swap(nums[dad], nums[son]);
            dad = son;
            son = dad * 2 + 1;
        }
    }
}

void heapsort(vector<int>& nums, int left, int right){
    for(int i = right / 2;i >= 0;i--){
        heapify(nums, i, right);
    }

    for(int i = right;i >= 0;i--){
        swap(nums[i], nums[0]);
        heapify(nums, 0, i - 1);
    }
}


int main(){
    int n = 10;
    vector<int> nums(n);
    srand(unsigned(time(0)));
    
    for(int i = 0;i < n;i++){
        nums[i] = rand() % 20;
        cout<<nums[i]<<" ";
    }
    cout<<endl;
    heapsort(nums, 0, nums.size() - 1);
    
    for(auto x : nums) cout<<x<<" ";
    cout<<endl;
    return 0;
}
```