# sample code

## 架構圖

```mermaid
flowchart TB
    %% 先定義節點名稱和顯示名稱
    E00[登入]
    E01[首頁]
    E02[公告]
    E03[錯誤alert]
    
    %% 使用已定義的節點名稱構建流程圖
    E00 --輸入帳號--> E01
    E00 --api有誤或沒輸入--> E03
    E01 --公告按鈕--> E02
    E01 --登出--> E00
    E02 --返回--> E01
```

## 技術選型與理由

> - MVI架構
>   - 分為四個檔案 view viewModel repository result
>     - view: UI
>     - viewModel: intent & state
>     - repository: 負責call api
>     - result: api response
> - 理由
>   - state 主要是由 intent 我有試著把它們拆開來放在不同class但有遇到許多問題 像是 明明已經更改了屬性 但view卻沒有動作之類的 並且拆開也會增加資料傳遞的麻煩
