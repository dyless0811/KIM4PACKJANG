/**
 *	Pagination을 위한 도구 클래스
 *	
 *	- 입력(준비물)
 *		- 페이지번호(p)
 *		- 검색분류(column)
 *		- 검색어(keyword)
 *		- 데이터 개수(count)
 *	- 처리
 *	- 출력(결과물) 
 */
package semi.beans;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

//장바구니 페이지네이션
public class BasketPagination {
	//필수 데이터
		private int p;
		private int count;
		
		//생성자를 이용하여 필수 데이터를 설정하도록 구현
		public BasketPagination(HttpServletRequest req) {
			try {
				this.p = Integer.parseInt(req.getParameter("p"));
				if(this.p <= 0) throw new Exception();
			}
			catch(Exception e) {
				this.p = 1;
			}
		}
		
		//계산 메소드
		private int pageSize = 10;
		private int blockSize = 10;
		private int begin, end;
		private int startBlock, finishBlock, lastBlock;
		private List<BasketVo> list;
		public void calculate() throws Exception {
			//count 계산
			BasketDao basketDao = new BasketDao();
			this.count = basketDao.count();
			
			
			//rownum 계산
			this.end = this.p * this.pageSize;
			this.begin = this.end - (this.pageSize - 1);
			
			//block 계산
			this.lastBlock = (this.count - 1) / this.pageSize + 1;
			this.startBlock = (this.p - 1) / this.blockSize * this.blockSize + 1;
			this.finishBlock = this.startBlock + (this.blockSize - 1);
			
			this.list = basketDao.listByTreeSort(begin, end);//계층형
			
		}
		public int getPage() {
			return p;
		}
		public int getCount() {
			return count;
		}
		public int getPageSize() {
			return pageSize;
		}
		public int getBlockSize() {
			return blockSize;
		}
		public int getBegin() {
			return begin;
		}
		public int getEnd() {
			return end;
		}
		public int getStartBlock() {
			return startBlock;
		}
		public int getFinishBlock() {
			return finishBlock;
		}
		public int getLastBlock() {
			return lastBlock;
		}
		
		//추가 : 이전이 존재하나요?
		public boolean isPreviousAvailable() {
			return this.startBlock > 1;
		}
		//추가 : 다음이 존재하나요?
		public boolean isNextAvailable() {
			return this.finishBlock < this.lastBlock; 
		}
		//추가 : 진짜 마지막 블록 번호 반환
		public int getRealLastBlock() {
			return Math.min(this.finishBlock, this.lastBlock);
		}
		//추가 : 이전을 누르면 나오는 블록 번호
		public int getPreviousBlock() {
			return this.startBlock - 1;
		}
		//추가 : 다음을 누르면 나오는 블록 번호
		public int getNextBlock() {
			return this.finishBlock + 1;
		}
		
		
		@Override
		public String toString() {
			return "Pagination [p=" + p + ", count=" + count + ", pageSize="
					+ pageSize + ", blockSize=" + blockSize + ", begin=" + begin + ", end=" + end + ", startBlock="
					+ startBlock + ", finishBlock=" + finishBlock + ", lastBlock=" + lastBlock + "]";
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public void setBlockSize(int blockSize) {
			this.blockSize = blockSize;
		}
//		public List<BoardDto> getList() {
//			return list;
//		}
}