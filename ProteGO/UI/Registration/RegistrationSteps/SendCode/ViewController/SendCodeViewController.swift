import UIKit
import RxSwift

final class SendCodeViewController: UIViewController, CustomView {

    typealias ViewClass = SendCodeView

    var stepFinishedObservable: Observable<SendCodeFinishedData> {
        return viewModel.stepFinishedObservable
    }

    private let viewModel: SendCodeViewModelType

    init(viewModel: SendCodeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = ViewClass()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: customView)
    }
}

extension SendCodeViewController: DismissKeyboardDelegate {
    func dismissKeyboard() {
        customView.dismissKeyboard()
    }
}
