pragma solidity ^0.5.2;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw an error.
 * Based off of https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol.
 */
library SafeMath {
    /*
     * Internal functions
     */

    function mul(uint256 a, uint256 b)
        internal
        pure
        returns (uint256)
    {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b)
        internal
        pure
        returns (uint256)
    {
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b)
        internal
        pure
        returns (uint256) 
    {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b)
        internal
        pure
        returns (uint256) 
    {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract LISAreputation {
  mapping(address => uint256) public reputation;
  using SafeMath for uint256; 

  function joinStudents(address _student) public {
    reputation[_student] = 9;
  }
  
  function isStipendEligible(address x) public view returns (bool) {
    return reputation[x] > 0;
  }

  function reportLISAviolation(address reportedstudent) public {
    require(isStipendEligible(msg.sender));
    reputation[reportedstudent] = reputation[reportedstudent].sub(1); 
  }
}
