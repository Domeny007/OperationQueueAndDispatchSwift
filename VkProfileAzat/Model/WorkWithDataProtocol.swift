import Foundation

protocol WorkWithData {
    func syncSaveNews(with: News)
    func asyncSaveNews(with: News, completionBlock: @escaping (Bool) -> ())
    func syncGetAllNews() -> [News]
    func asyncGetAllNews(completionBlock: @escaping ([News]) -> ())
    func syncSearch(id: Int) -> News
    func asyncSearchNews(id: Int, completionBlock: @escaping (News) -> ())
}
