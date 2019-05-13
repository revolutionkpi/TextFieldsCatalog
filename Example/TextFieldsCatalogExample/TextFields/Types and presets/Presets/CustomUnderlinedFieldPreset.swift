//
//  CustomUnderlinedFieldPreset.swift
//  TextFieldsCatalogExample
//
//  Created by Александр Чаусов on 31/01/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import UIKit
import TextFieldsCatalog

enum CustomUnderlinedFieldPreset: CaseIterable, AppliedPreset {
    case password
    case email
    case phone
    case cardExpirationDate
    case cvc
    case cardNumber
    case qrCode
    case birthday
    case sex

    var name: String {
        switch self {
        case .password:
            return L10n.Presets.Password.name
        case .email:
            return L10n.Presets.Email.name
        case .phone:
            return L10n.Presets.Phone.name
        case .cardExpirationDate:
            return L10n.Presets.Cardexpirationdate.name
        case .cvc:
            return L10n.Presets.Cvc.name
        case .cardNumber:
            return L10n.Presets.Cardnumber.name
        case .qrCode:
            return L10n.Presets.Qrcode.name
        case .birthday:
            return "Дата"
        case .sex:
            return "Пол"
        }
    }

    var description: String {
        switch self {
        case .password:
            return L10n.Presets.Password.description
        case .email:
            return L10n.Presets.Email.description
        case .phone:
            return L10n.Presets.Phone.description
        case .cardExpirationDate:
            return L10n.Presets.Cardexpirationdate.description
        case .cvc:
            return L10n.Presets.Cvc.description
        case .cardNumber:
            return L10n.Presets.Cardnumber.description
        case .qrCode:
            return L10n.Presets.Qrcode.description
        case .birthday:
            return "Пример работы поля для ввода какой либо даты. К примеру, даты рождения"
        case .sex:
            return "Пример работы поля для выбора какого-то значения из заранее заготовленного списка. Для более простого выбора используется барабан"
        }
    }

    func apply(for field: Any, with heightConstraint: NSLayoutConstraint) {
        guard let field = field as? CustomUnderlinedTextField else {
            return
        }
        apply(for: field, heightConstraint: heightConstraint)
    }

}

// MARK: - Tune

private extension CustomUnderlinedFieldPreset {

    func apply(for textField: CustomUnderlinedTextField, heightConstraint: NSLayoutConstraint) {
        switch self {
        case .password:
            tuneFieldForPassword(textField)
        case .email:
            tuneFieldForEmail(textField)
        case .phone:
            tuneFieldForPhone(textField)
        case .cardExpirationDate:
            tuneFieldForCardExpirationDate(textField)
        case .cvc:
            tuneFieldForCvc(textField)
        case .cardNumber:
            tuneFieldForCardNumber(textField)
        case .qrCode:
            tuneFieldForQRCode(textField)
        case .birthday:
            tuneFieldForBirthday(textField)
        case .sex:
            tuneFieldForSex(textField)
        }
    }

    func tuneFieldForPassword(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Password.placeholder, maxLength: nil)
        textField.configure(correction: .no, keyboardType: .asciiCapable)
        textField.disablePasteAction()
        textField.setReturnKeyType(.next)
        textField.setTextFieldMode(.password)

        let validator = TextFieldValidator(minLength: 8, maxLength: 20, regex: SharedRegex.password)
        validator.shortErrorText = L10n.Presets.Password.shortErrorText
        validator.largeErrorText = L10n.Presets.Password.largeErrorText(String(20))
        textField.validator = validator

        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.password)
    }

    func tuneFieldForEmail(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Email.placeholder, maxLength: nil)
        textField.configure(correction: .no, keyboardType: .emailAddress)
        textField.validator = TextFieldValidator(minLength: 1, maxLength: nil, regex: SharedRegex.email)
    }

    func tuneFieldForPhone(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Phone.placeholder, maxLength: nil)
        textField.configure(correction: .no, keyboardType: .phonePad)
        textField.validator = TextFieldValidator(minLength: 18, maxLength: nil, regex: nil, globalErrorMessage: L10n.Presets.Phone.errorMessage)
        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.phone)
    }

    func tuneFieldForCardExpirationDate(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Cardexpirationdate.placeholder, maxLength: nil)
        textField.configure(correction: .no, keyboardType: .numberPad)
        textField.validator = TextFieldValidator(minLength: 5, maxLength: nil, regex: nil, globalErrorMessage: L10n.Presets.Cardexpirationdate.errorMessage)
        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.cardExpirationDate)
    }

    func tuneFieldForCvc(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Cvc.placeholder, maxLength: nil)
        textField.configure(correction: .no, keyboardType: .numberPad)
        textField.validator = TextFieldValidator(minLength: 3, maxLength: nil, regex: nil, globalErrorMessage: L10n.Presets.Cvc.errorMessage)
        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.cvc)
    }

    func tuneFieldForCardNumber(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Cardnumber.placeholder, maxLength: nil)
        textField.configure(correction: .no, keyboardType: .numberPad)
        textField.validator = TextFieldValidator(minLength: 19, maxLength: nil, regex: nil, globalErrorMessage: L10n.Presets.Cardnumber.errorMessage)
        textField.maskFormatter = MaskTextFieldFormatter(mask: FormatterMasks.cardNumber)
    }

    func tuneFieldForQRCode(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: L10n.Presets.Qrcode.placeholder, maxLength: 10)
        textField.configure(correction: .no, keyboardType: .asciiCapable)
        textField.setHint(L10n.Presets.Qrcode.hint)
        textField.validator = TextFieldValidator(minLength: 10, maxLength: 10, regex: nil)

        let actionButtonConfig = ActionButtonConfiguration(image: UIImage(asset: Asset.qrCode),
                                                           normalColor: Color.Button.active,
                                                           pressedColor: Color.Button.pressed)
        textField.setTextFieldMode(.custom(actionButtonConfig))
        textField.onActionButtonTap = { field in
            field.setText("qrcode1234")
        }
    }

    func tuneFieldForBirthday(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: "Дата рождения", maxLength: nil)
        textField.validator = TextFieldValidator(minLength: 1,
                                                 maxLength: nil,
                                                 regex: nil,
                                                 globalErrorMessage: "Вы должны выбрать дату своего рождения")

        let inputViewSize = CGSize(width: UIScreen.main.bounds.width, height: 261)
        let inputView = DatePickerView.view(size: inputViewSize,
                                            textField: textField)
        inputView.datePicker.backgroundColor = .white
        textField.inputView = inputView

        textField.onDateChanged = { date in
            print("this is selected date - \(date)")
        }
    }

    func tuneFieldForSex(_ textField: CustomUnderlinedTextField) {
        textField.configure(placeholder: "Пол", maxLength: nil)
        textField.validator = TextFieldValidator(minLength: 1,
                                                 maxLength: nil,
                                                 regex: nil,
                                                 globalErrorMessage: "Вы должны определиться со своим полом")

        let inputViewSize = CGSize(width: UIScreen.main.bounds.width, height: 261)
        let inputView = PlainPickerView.view(size: inputViewSize,
                                             textField: textField,
                                             data: Sex.allCases.map { $0.rawValue })
        inputView.picker.backgroundColor = .white
        textField.inputView = inputView

        textField.onTextChanged = { field in
            if let value = field.currentText().flatMap({ Sex(rawValue: $0) }) {
                print(value)
            } else {
                print("sex is undefined")
            }
        }
    }

}
