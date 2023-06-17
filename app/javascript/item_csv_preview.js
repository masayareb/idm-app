document.addEventListener('DOMContentLoaded', () =>{
  const csvInput = document.getElementById('csv-file-input');

  csvInput.addEventListener('change', function(e) {
    var fileInput = e.target;
    var file = fileInput.files[0];
  
    if (file) {
      var reader = new FileReader();
  
      reader.onload = function(e) {
        var contents = e.target.result;
        console.log(contents);
        displayCSVPreview(contents);
      };
  
      reader.readAsText(file);
    }
  
  
    function displayCSVPreview(csvContents) {
      //改行部分で分割
      var lines = csvContents.split('\n');
      var previewTable = document.createElement('table');
      
      lines.forEach(function(line) {
        var row = document.createElement('tr');
        var cells = line.split(',');
        
        cells.forEach(function(cell) {
          var cellElement = document.createElement('td');
          cellElement.textContent = cell;
          row.appendChild(cellElement);
        });
        
        previewTable.appendChild(row);
      });
      
      var previewContainer = document.getElementById('csv-preview');
      previewContainer.innerHTML = '';
      previewContainer.appendChild(previewTable);
    }
  
  });

})

