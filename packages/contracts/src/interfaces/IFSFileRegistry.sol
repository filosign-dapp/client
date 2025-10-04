// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Auto-generated from src/FSFileRegistry.sol — DO NOT EDIT (regenerate with the script only)

interface IFSFileRegistry {
    struct FileData {
        bytes32 pieceCidPrefix;
        address sender;
        mapping(address => bool) recipients;
        uint16 pieceCidTail;
        bool acked;
    }

    struct SignatureData {
        address signer;
        uint48 timestamp;
        bytes32 signatureVisualHash;
        uint8 signatureVisualPositionTop;
        uint8 signatureVisualPositionLeft;
        uint8 v;
        bytes32 r;
        bytes32 s;
    }

    struct FileDataView {
        bytes32 pieceCidPrefix;
        address sender;
        uint16 pieceCidTail;
        bool acked;
    }

    function manager() external view returns (address);
    event FileRegistered();
    event FileAcknowledged();
    event SignatureSubmitted();
    function acknowledge(bytes32 cidIdentifier_) external;
    function registerFile(bytes32 pieceCidPrefix_, uint16 pieceCidTail_, address[] calldata recipients_) external;
    function submitSignature(bytes32 cidIdentifier_, bytes32 signatureVisualHash_, uint8 v_, bytes32 r_, bytes32 s_) external;
    function cidIdentifier(bytes32 pieceCidPrefix_, uint16 pieceCidTail_) external pure returns (bytes32);
    function getFileData(bytes32 cidIdentifier_) external view returns (FileDataView memory);
    function isRecipient(bytes32 cidIdentifier_, address recipient_) external view returns (bool);
    function getSignatureData(bytes32 cidIdentifier_) external view returns (SignatureData memory);
}
