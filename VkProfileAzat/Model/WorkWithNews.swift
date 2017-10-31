import Foundation

class WorkWithNews: WorkWithData {
    static let instance = WorkWithNews()
    var newsId = 0
    var newsArray = [Int: News]()
    
    
    func syncSaveNews(with news: News) {
        newsArray[newsId] = news
        newsId += 1
    }
    func asyncSaveNews(with news: News, completionBlock: @escaping (Bool) -> ()) {
        let queue = OperationQueue()
        queue.addOperation { [weak self] in
            guard let strongSelf = self else{return}
             strongSelf.newsArray[strongSelf.newsId] = news
            strongSelf.newsId += 1
            completionBlock(true)
        }
    }
    
    func syncGetAllNews() -> [News] {
        var newsTempArray:[News] = []
        for i in 0..<newsArray.count {
            newsTempArray.append(newsArray[i]!)
        }
        return newsTempArray
    }
    
    func asyncGetAllNews(completionBlock: @escaping ([News]) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation { [weak self] in
            guard let strongSelf = self else{ return }
            let currentNews = strongSelf.syncGetAllNews()
            completionBlock(currentNews)
        }
    }
    
    func syncSearch(id: Int) -> News {
        guard let currentNews = newsArray[id] else {return newsArray[0]!}
        return currentNews
    }
    
    func asyncSearchNews(id: Int, completionBlock: @escaping (News) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation { [weak self] in
            guard let strongSelf = self else {return}
            if let currentNews = strongSelf.newsArray[id] {
                completionBlock(currentNews)
            }
        }
    }
    
}
