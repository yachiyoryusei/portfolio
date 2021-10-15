/*global indexedDB*/
/*global dbName*/
/*global storeName*/
/*global createPieChart*/

function createList() {
    //データベースからデータを全件取得
    let database = indexedDB.open(dbName);
    database.onsuccess = function (event) {
        let db = event.target.result;
        let transaction = db.transaction(storeName, "readonly");
        let store = transaction.objectStore(storeName);

        store.getAll().onsuccess = function (data) {
            console.log(data);
            let rows = data.target.result;
            let section = document.getElementById("list");
            //入出金一覧のテーブルを作る
            //バッククオートでヒアドキュメント
            let table = `
                <table>
                    <tr>
                        <th>日付</th>
                        <th>収支</th>
                        <th>カテゴリ</th>
                        <th>金額</th>
                        <th>メモ</th>
                        <th>削除
                    </th>
                </tr>
            `;
            //入出金のデータを表示
            rows.forEach((element) => {
                console.log(element);
                table += `
                    <tr>
                        <td>${element.date}</td>
                        <td>${element.balance}</td>
                        <td>${element.category}</td>
                        <td>${element.amount}</td>
                        <td>${element.memo}</td>
                        <td><button onclick="deleteData('${element.id}')">×</button>
                        </td>
                    </tr>
                `;
            });
            table += `</table>`;
            section.innerHTML = table;

            //円グラフの作成
            createPieChart(rows);
        }
    }
}