class DataExportsController < ApplicationController
  require 'csv'

  def export_csv
    @item = Item.new
    if current_user&.admin?
      @items = Item.all  
    else
      @items = Item.where(user_id: current_user.id)
    end

    respond_to do |format|
      format.html
      format.csv do |csv|
        send_items_csv(@items)
      end
    end
  end

  private

  def send_items_csv(items)
    csv_data = CSV.generate do |csv|
      column_names = ["id","状態","機器種類","機器名","メーカー名","社員番号","ユーザ名","所属","S/N","IPアドレス","購入年月","利用予定年数","備考","レコード作成日","レコード更新日"]
      csv << column_names

      items.each do |item|
        column_values = [
          item.id,
          item.status.name,
          item.category.name,
          item.item,
          item.manufacturer,
          item.user.employee_number,
          item.user.name,
          item.user.affiliation,
          item.serial_number,
          item.ip,
          item.purchase_date,
          item.years_of_use,
          item.remarks,
          item.created_at,
          item.updated_at
        ]

        csv << column_values
      end
    end
    send_data(csv_data, filename: "機器一覧.csv")
  end
end
