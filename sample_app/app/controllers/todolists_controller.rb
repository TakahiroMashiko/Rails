class TodolistsController < ApplicationController

  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３. 詳細画面（修正前：トップ画面）へリダイレクト
    # redirect_to '/top' を削除して、以下コードに変更
    redirect_to todolist_path(list.id)

  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  # ! ここから下はcontrollerの中でしか呼び出せません !
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end