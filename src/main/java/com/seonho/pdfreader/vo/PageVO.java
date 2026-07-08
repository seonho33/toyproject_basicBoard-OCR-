package com.seonho.pdfreader.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVO<T> {
    
    private int currentPage;    //현재 페이지 번호
    private int pageSize;       //한 페이지에 보여줄 list 갯수
    private int pageBlockSize;

    private int totalCount;     //전체 게시글 갯수
    private int totalPage;      //전체 페이지 갯수

    private int startPage;      //화면 하단에 보여줄 첫번째 번호
    private int endPage;        //화면 하단에 보여줄 마지막 번호

    private boolean hasPrevious;//이전 버튼이 존재하는지 여부 
    private boolean hasNext;    //다음 버튼이 존재하는지 여부

    private List<T> itemList;   //게시글 목록


    public PageVO(){
        this(10,5);
    }

    public PageVO(int pageSize, int pageBlockSize){
        this.pageSize = pageSize;
        this.pageBlockSize = pageBlockSize;
    }

    public void calculate(int currentPage, int totalCount){
        this.currentPage = currentPage;
        this.totalCount = totalCount;

        this.totalPage = (int) Math.ceil((double)totalCount/pageSize);

        if (this.totalCount == 0) {
            this.totalPage = 0;
            this.startPage = 0;
            this.endPage = 0;
            this.hasPrevious = false;
            this.hasNext = false;
            return;
        }

        if(this.currentPage<1){
            this.currentPage = 1;
        }

        if(this.totalPage > 0 && this.currentPage > this.totalPage){
            this.currentPage = this.totalPage;
        }

        this.startPage = ((this.currentPage-1)/pageBlockSize)*pageBlockSize +1;
        this.endPage = Math.min(startPage + pageBlockSize -1 , totalPage);

        this.hasPrevious = startPage > 1;
        this.hasNext = endPage < totalPage;

    }

    public int getStartIndex(){
        return (currentPage - 1) * pageSize;
    }

    public int getEndIndex(){
        return Math.min(getStartIndex()+pageSize, totalCount);
    }


}
