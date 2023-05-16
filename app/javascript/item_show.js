function categoryPullDown(){
  const pullDownButton = document.getElementById("category-search-btn")
  const pullDownParents = document.getElementById('category-pull-down')
  const listContainer = document.getElementById('category')

  pullDownButton.addEventListener('click', () => {
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })

  // pullDownParents.addEventListener('mouseout', (e) => {
  // //e.relatedTargetがリストを包む要素に含まれているかどうかを確認します。含まれていなければ、リストを非表示へ
  //   if(!listContainer.contains(e.relatedTarget)){
  //     pullDownParents.removeAttribute("style")
  //   }
  // })
}

function statusPullDown(){
  const pullDownButton = document.getElementById("status-search-btn")
  const pullDownParents = document.getElementById('status-pull-down')
  const listContainer = document.getElementById('status')

  pullDownButton.addEventListener('click', () => {
    // プルダウンメニューの表示と非表示の設定
    if (pullDownParents.getAttribute("style") == "display:block;") {
    pullDownParents.removeAttribute("style")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })

  // pullDownParents.addEventListener('mouseout', (e) => {
  // //e.relatedTargetがリストを包む要素に含まれているかどうかを確認します。含まれていなければ、リストを非表示へ
  //   if(!listContainer.contains(e.relatedTarget)){
  //     pullDownParents.removeAttribute("style")
  //   }
  // })
}

window.addEventListener('load', categoryPullDown);
window.addEventListener('load', statusPullDown);