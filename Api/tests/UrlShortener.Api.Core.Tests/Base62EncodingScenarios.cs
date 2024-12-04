using UrlShortener.Core;

namespace UrlShortener.Api.Core.Tests;

public class Base62EncodingScenarios
{
    [Theory]
    [InlineData(1,"1")]
    [InlineData(20,"K")]
    [InlineData(62,"10")]
    [InlineData(61,"z")]
    [InlineData(987654321,"14q60P")]
    public void Should_encode_number_to_basae62(long number, string expected)
    {
        number.EncodeToBase62().Should().Be(expected);
    }
}