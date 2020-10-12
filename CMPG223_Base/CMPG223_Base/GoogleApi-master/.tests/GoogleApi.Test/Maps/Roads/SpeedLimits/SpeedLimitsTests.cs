using System;
using System.Linq;
using System.Threading;
using GoogleApi.Entities.Common;
using GoogleApi.Entities.Common.Enums;
using GoogleApi.Entities.Maps.Roads.SpeedLimits.Request;
using GoogleApi.Exceptions;
using NUnit.Framework;

namespace GoogleApi.Test.Maps.Roads.SpeedLimits
{
    [TestFixture]
    public class SpeedLimitsTests : BaseTest
	{
        [Test]
        public void SpeedLimitsTest()
        {
            var request = new SpeedLimitsRequest
            {
                Key = this.ApiKey,
                Path = new[]
                {
                    new Location(60.170880, 24.942795),
                    new Location(60.170879, 24.942796),
                    new Location(60.170877, 24.942796)
                }
            };

            var result = GoogleMaps.SpeedLimits.Query(request);
            Assert.IsNotNull(result);
            Assert.AreEqual(Status.Ok, result.Status);
        }

        [Test]
	    public void SpeedLimitsWhenAsyncTest()
	    {
            var request = new SpeedLimitsRequest
            {
                Key = this.ApiKey,
                Path = new[] { new Location(0, 0) }
            };
            var result = GoogleMaps.SpeedLimits.QueryAsync(request).Result;

            Assert.IsNotNull(result);
            Assert.AreEqual(Status.Ok, result.Status);
        }

        [Test]
	    public void SpeedLimitsWhenAsyncAndCancelledTest()
	    {
	        var request = new SpeedLimitsRequest
	        {
	            Key = this.ApiKey,
	            Path = new[] { new Location(0, 0) }
	        };
	        var cancellationTokenSource = new CancellationTokenSource();
	        var task = GoogleMaps.SpeedLimits.QueryAsync(request, cancellationTokenSource.Token);
	        cancellationTokenSource.Cancel();

	        var exception = Assert.Throws<OperationCanceledException>(() => task.Wait(cancellationTokenSource.Token));
	        Assert.IsNotNull(exception);
	        Assert.AreEqual(exception.Message, "The operation was canceled.");
	    }

	    [Test]
	    public void SpeedLimitsWhenInvalidKeyTest()
	    {
	        var request = new SpeedLimitsRequest
	        {
	            Key = "test",
	            Path = new[]
	            {
	                new Location(60.170880, 24.942795),
	                new Location(60.170879, 24.942796),
	                new Location(60.170877, 24.942796)
	            }
	        };

	        var exception = Assert.Throws<AggregateException>(() => GoogleMaps.SpeedLimits.QueryAsync(request).Wait());
	        Assert.IsNotNull(exception);

	        var innerException = exception.InnerExceptions.FirstOrDefault();
	        Assert.IsNotNull(innerException);
	        Assert.AreEqual(typeof(GoogleApiException).ToString(), innerException.GetType().ToString());
	        Assert.AreEqual("Response status code does not indicate success: 400 (Bad Request).", innerException.Message);
	    }

        [Test]
        public void SpeedLimitsWhenPlaceIdsTest()
        {
            Assert.Inconclusive();
        }

        [Test]
        public void SpeedLimitsWhenKeyIsNullTest()
        {
            var request = new SpeedLimitsRequest
            {
                Key = null,
                Path = new[] { new Location(0, 0) }
            };

            var exception = Assert.Throws<AggregateException>(() => GoogleMaps.SpeedLimits.QueryAsync(request).Wait());
            Assert.IsNotNull(exception);

            var innerException = exception.InnerException;
            Assert.IsNotNull(innerException);
            Assert.AreEqual(typeof(GoogleApiException), innerException.GetType());
            Assert.AreEqual(innerException.Message, "Key is required");
        }

        [Test]
        public void SpeedLimitsWhenKeyIsStringEmptyTest()
        {
            var request = new SpeedLimitsRequest
            {
                Key = string.Empty,
                Path = new[] { new Location(0, 0) }
            };

            var exception = Assert.Throws<AggregateException>(() => GoogleMaps.SpeedLimits.QueryAsync(request).Wait());
            Assert.IsNotNull(exception);

            var innerException = exception.InnerException;
            Assert.IsNotNull(innerException);
            Assert.AreEqual(typeof(GoogleApiException), innerException.GetType());
            Assert.AreEqual(innerException.Message, "Key is required");
        }

        [Test]
        public void SpeedLimitsWhenPathIsNullAndPlaceIdsIsNullTest()
        {
            var request = new SpeedLimitsRequest
            {
                Key = this.ApiKey
            };

            var exception = Assert.Throws<AggregateException>(() => GoogleMaps.SpeedLimits.QueryAsync(request).Wait());
            Assert.IsNotNull(exception);

            var innerException = exception.InnerException;
            Assert.IsNotNull(innerException);
            Assert.AreEqual(typeof(GoogleApiException), innerException.GetType());
            Assert.AreEqual(innerException.Message, "Path or PlaceId's is required");
        }

        [Test]
        public void SpeedLimitsWhenPathIsEmptyAndPlaceIdsIsEmptyTest()
        {
            var request = new SpeedLimitsRequest
            {
                Key = this.ApiKey,
                Path = new Location[0],
                PlaceIds = new string[0]
            };

            var exception = Assert.Throws<AggregateException>(() => GoogleMaps.SpeedLimits.QueryAsync(request).Wait());
            Assert.IsNotNull(exception);

            var innerException = exception.InnerException;
            Assert.IsNotNull(innerException);
            Assert.AreEqual(typeof(GoogleApiException), innerException.GetType());
            Assert.AreEqual(innerException.Message, "Path or PlaceId's is required");
        }

        [Test]
        public void SpeedLimitsWhenPlaceIdsCountIsGreaterThanAllowedTest()
        {
            var request = new SpeedLimitsRequest
            {
                Key = this.ApiKey,
                PlaceIds = new string[101]
            };

            var exception = Assert.Throws<AggregateException>(() => GoogleMaps.SpeedLimits.QueryAsync(request).Wait());
            Assert.IsNotNull(exception);

            var innerException = exception.InnerException;
            Assert.IsNotNull(innerException);
            Assert.AreEqual(typeof(GoogleApiException), innerException.GetType());
            Assert.AreEqual(innerException.Message, "Max PlaceId's exceeded");
        }
    }
}