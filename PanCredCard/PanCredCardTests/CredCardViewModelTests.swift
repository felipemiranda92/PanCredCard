

//
//  CredCardViewModelTest.swift
//  PanCredCardTests
//
//  Created by Felipe Miranda Santos on 12/03/24.
//

import XCTest
@testable import PanCredCard

final class CredCardViewModelTest: XCTestCase {

    var credCardViewModel: CredCardViewModel!
    
    override func setUpWithError() throws {
        credCardViewModel = CredCardViewModel()
    }

    override func tearDownWithError() throws {
        credCardViewModel = nil
    }

    func testMaskCreditCardNumber() throws {
        
        let validNumber = "1234567890123456"
        let maskedValidNumber = credCardViewModel.maskCreditCardNumber(number: validNumber)
        XCTAssertEqual(maskedValidNumber, "************3456")
        
        let invalidNumber = "123"
        let maskedInvalidNumber = credCardViewModel.maskCreditCardNumber(number: invalidNumber)
        XCTAssertEqual(maskedInvalidNumber, "Número inválido")
    }
    
    func testLoadImageForCard() {
        
        let validImageHex = "iVBORw0KGgoAAAANSUhEUgAAAEUAAABFCAIAAACT77x+AAAACXBIWXMAAA9hAAAPYQGoP6dpAAAAB3RJTUUH4gkKDxMmTUsRbgAAC5pJREFUaN7tmXlwVEUex7/9rjkymUyYHJNrkpCEhBxAAtmAYQMqihcCCrLq4oGKF6zgsa6rwVVXocTSZVdLUDw4XFcoYQW8wS2uBKIhMQkJEEICuU+Smcz9Xvf+8cgwQVCoomprrel6VUn9Xr/u/vTx+31/PQTP7MavpRi1AodfVwnyBHmCPEGeIE+QJ8gT5AnyBHmCPEGeIE+QJ8gT5PmlIqh/CIH/boQxuGUqcETkSWBVl48C0ImXZwoohUehUBgvctLwjgJ7FDkiBLx1eakoEIE7a3H7KDuXh7J18zLm50b7rcYX9i8tjHthWlJg6+a/lszNjlw9K+2y8JS12H/3r7pP78jKjQ25UJ24FQcWTYx7ZmqC3/KnrxstBmlJYZzfEvVyabfDN4zHqBPm50bP33y0ttPhUdg/52V8syBnR12fR2F5/yjXiZxCUbE477FJcdekhW+v6y3eeVLgQBlKHxq39PMTZS22wEEQQr5/JDfzjR/00tkFn5wUtuqmFACzN9Ye73W9eXNqYaLxxJO/2dXQP3PD4eYBD4B5OVFPT4l/6qvGXcdPy5StnT1qz8KxGyu6+lxy4epKvciNitR/PC9jy+GevU22R7fVx4RKX9+b85P9xtj0USMYsLmq2yNTAE98ceKLu7O31/Uxxmpb7BB5MPb45ydWXJckcGTWxtof2wfBAMYow7EeZ3nrIGQKxvxAAOpa7JB4yBRgADnUYv+gvOP0sitqOh3HOxz9LpnnSOHqypLGARCAMlCWHx8KYG1Ze79LBjB/85Gjj+dHGSSfwo602CHxh9oGV0xPuiUrYmttb3WLvcukPd/5oVg/J/3D8g6PTPMTQr8/ZftPQ7/IkwcLYtSNyXNEoXjrQOvK65M5QrbX9BCBsIDVgML+Mj35hvQRATjqf/jigTFmnehV6MyNtX1OX1W7gyMAAUewr2mg5JQNjK28KTXHEkIZEk2aTdXd/Q5fhiXkSIejodftUei8nAi3zNTWAIx+4wfb84XndhTo365MC9eK3ILNRwG8PTO1MDlMUeij245bwzTqoNMjddZwjY+yHqfvzdI2MDbWYoAScAgJWm2ew11O9Wke8J6xM0SGiNGhYnyYRiMM61zkyfLdzQBWzkh98rfx09PCrx8VPjpSf/+WYyB4YVriTVlmhbKFW+pH6EW1J53I6UTO5aOv7m6+kP8AwC2+IraqwwGOQKEZkfoF4y0ANlR0+r2G00dX3ZTKGF7f17q+ohOUFV9lPbu7AHDk3bKOezcfVZ8/fd3o58z/e3nS8gPJKw6227xGDT8mJoQNrWrLgAfAjNFmfzM9Tp/do8BHZ2SYlxbGg7H1hzoHvYr6VidwFYvzADy7o6GibfCC/np2ZsSEtyoAEIELf6mEMYAjdrdysMU+1hICgDJMSzWBspV7mkWexEXoi5LDhrWhsBU3jpyVGeGfe/+bgiTTwWYbKLtzXNS6Oen80BZhjCWZNNUdjs3V3c9daVWNN284DAAa3vTifnUYAHYe7y9ICAXAgPQIfW6soaJ18PmdTbjAzTt3tMdZ3tgPQCtyIsdJPCfxHAiue7/K7+UNEh8bpmWAV2F35UY5hubMvw6Nfe7vm+3qU3rS5t9vn9+dvf62DMh0U1V3r1P2f+FT2LKrEwEUf9P0yGf16w51nnbJBxoHAGgFTuA4kefUeDjv41o+INqUL8ozaPhhEeec9XmnrAMCl2rW1T+Rr5rabN64l0pslDX0usFAGQPw4dxR166tglf5fW40ZYD6AJQxEKwpbV2zv9UvOe4cFwXGwJhPofPHRdV1OZfvOhm74oDt+SsYAyijDONjQ+fmRG4u73i7pO3YKJfdo4BDtEHq+PNEtRmPTLXFe70euquhX/WlqlN47YaRD206ApGj7DxYgkbg/jA5fmF+TFWH45r3q5PDtQceHrd0qpWB1fe6Fk21RoaIAKalhD9RlECBzCh9n0teVBTPEyJwZE525BhLyDnxB8DDU6ySQEw6YVN19yvXJsmU+RS6qqTt/gmW5gFPilnr9Cmbbh+9d1LspzU9D0+MWVPWsWRy/B1jow53Oaa8UxUfpqlcnPf0FKtHoTa3vOhKa6hGAHD7J3UfzxvdbvcOuGWjRvgpD+kaPOOOJq+pPNbjgk/5auG4vFjDZREBEk8mvl35WGHcrVkRw5lResr+5Bcn1s0dlWjSBuqXuR/X7j4xAJluvSenMNEY+BUDkl8t235XVk7ADI5+44de5xl9YNQKJPj73P+Dvv7lolDQX6qjSm+Zgv1vYNy8cnE8jD03LfnqlDDyU43BmCo8fAqd/kE1pfjy/rFqTsEYG1afMXo2Al/IPiRszr4848XIkKc5xx74CU8ucn0YsqL1eXGG7xoGhg0FLMogtdu9HMG0lPBP78wM14uZkfr9J20cQYpZ19Dr8ncm8CQnWp8Qphn0Kt/W9/ujCschPUKXZtZRhi+P9SnDd0GiSRobYzjtkmu7nP4IpjA2yRpqMUg1nY7G0x6/39aJnHDxq3mizzN7XTV4LnD2dt4/tvjbpsOdjjCt0Fc8iSMkZ1V5TacjM0r/zFTr/E/qhslGynbcm5Nq1t3yQRUkPtA+Myti8x2Zcz6qdcvDgB7Ij1l2dWLCi/uH1QfYK0WZf/uhrssZ2Mj62zKES92jsUbNO7PT3D6qOtDRkfrSh8YZn90zACz893GXT6npGIwxag4vmbCxsgtAbozhhWuSZIVtre3eUNE1Y31Ny9MT1blcPzeDEBxqHXxlZ9OOo31nhJKPfnj7aMPQ6FPM2ge3HoPIFyQYnyqKV0+m1aQ51DZY1+4ATzbclqETODUPmJVpvmQekSPWMI2ae1Mwo5Y3SHzVk78Z8/r37x1sA0fAUL4o72yOGSbNyBgBYHaW+aPKburwqhJT5Mmc7AgAt2ZFvLKzSfFR/5rHGqWwoVgZGyrZPQrA4sKkhDANGLQCNyYmZLeaOAGJJo2G5xigpk+XzHPytHvMyrIzh0KmJY/nT7IacywhL9+Q8uw3jaBs7dz0mFDJX3/fSdvkNZWMoabTSRkbnxauTqfdo0S+XEqA7kEfBM4SKqn6hUj8tasr/Z8XXzfyvgmWvUd6t1R1b6noUoFjzLof/zCe4zmq0KK3KvyV18679P1m1Aq3TrDIlAGQKYs2SADcMn3u20YwgCMv7jp533iLv36/Sy45ZQPAE5Jm1n2zYIyqSAigE7jmfg/AJieavl6Qox4cprDbJlg0Q6d0fKxhZqY51qhZfbBtwC0TggOn7O0DnlUlre4XJy/5vOFYj4sx1u3wVbU7Htxaf8k80aHiu7PTHOr2YNBJHIAp71YxhixLiEemx3tdv13z494Hx6r1b0wfsePu7MAWVB6DxJ96ukA90zxP9CLnVXNEmb563chwneDPPtwyLYgPLUhIVy0z1tXsOdHv8CpOn7J8erJqPNRqv3J1JeH5S+ap73FJxfuGPArbflf2vpMDZc02jqDskVzKWGjxvn1N/Y9uOz7JalTTJwAvfXdKI5D6HneORe/PzBlD7ZIJscsP7G7ov3FdzWfzs9T8Z+TKsgD/ZgnTCq/uafbHCcoYfPSuPItp2T5O5IcCCgNP5mRHXAKPQeIKU8LFAO1IGY50O/c22YqSTe/dkmb3KCKHz+7JXrm3pbbLmR8fWjQyXFXfy7bVQyuAYOUNKTqRL0gNN+tEQtDj9FUuHj9r4+FBL/2kuntKsskzPAClmXUhGr4o2eTvNtYoLbvKGm2QJo00aYb0Gk8wPzf67rzoi9OjlG27J3tGhvnna4W/VGI1aX5cPP48Mn7pd9AJAN66OfWRibF+e+TLpaf+WHBZ7iibTrtf29ty0fraq0D+eQFHoBfUC4fzvAsRz0RxnwJfQDt6EW4Z9HIIPp4zGqWL3m8Sf06EvmDRi+cTgGevdiAOb0cr4HIVQoK/LwR5gjxBniBPkCfIE+QJ8gR5gjxBniBPkCfIc/nLfwHf6Q38rfdbOQAAAABJRU5ErkJggg=="
        let imageData = credCardViewModel.loadImageForCard(imageHex: validImageHex)
        XCTAssertNotNil(imageData)
        
    }
    

}

