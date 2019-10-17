Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E950DDA482
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Oct 2019 06:11:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iKx8m-0004G8-Mr
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Oct 2019 04:11:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iKx8l-0004Fy-2X
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Oct 2019 04:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FGz8qdq3Dw0gukgZrVxUVyXcJ/Gcz/OyEL/XFXnvkAM=; b=DLWWe77md9Z6fAnoEBYzAgVMQH
 ePddfwOSqmd5TvbC8Nk6JqjFspn7v3sO4qsaXeJapEtL8nLRDboeLJoTnXOn08SGKwuQ6D0t5xx/j
 +o/JVeF0X1dWfwW3f5d4yAXyyDqYwRE+/HGoyCIVpCIKRWEf8qzphAtS3Tt138QSsvNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FGz8qdq3Dw0gukgZrVxUVyXcJ/Gcz/OyEL/XFXnvkAM=; b=ARFX+6w1Oop+KKHCMtPAPWzVoc
 LG9DwczrYSWbyQ27geu+40KaMmACE9mtA0T5sLaTIYv6qpgpunITSSb5a38jBgxwa8Ky8Qe2Mr9nX
 7aFpKY8CEGhLHtNBT+IbRegl52w1eTV4r0ovI8moco5Ia5ONbrs0JlrAG+vqAVyS37Og=;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iKx8h-00C0RO-C9
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Oct 2019 04:11:54 +0000
Received: by mail-io1-f67.google.com with SMTP id u8so1292196iom.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Oct 2019 21:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FGz8qdq3Dw0gukgZrVxUVyXcJ/Gcz/OyEL/XFXnvkAM=;
 b=n5JWF3tD5Zg82bv6F8WCxSx1usc2qiyNCST0oWBdk5ZCXPwJe1l9NiLuV8BZsTP9Dt
 vko5Ctem7pHxv5Xy40Tq8+MVub/ziVVcY6A4zCTyE2Vs9TsVvdxvmRsizv3q8zxa7wiT
 HVpKaMEu/ZsfFkT1JMtp6PGVYh2dKLDuirimI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FGz8qdq3Dw0gukgZrVxUVyXcJ/Gcz/OyEL/XFXnvkAM=;
 b=aPuFcEnB4gAw7JgLUJpNyCp58E995f49xjMScJTEwE1NtDkXOyi3ROjvyg6qZYEbaH
 7CaCZZjpIUcsuKiQYdx2x2yp35eyG0pmWvPHJ2Q9eMQ7bhDnUFVZfv65yJdUd7UyGhtO
 V774CcKTGS45Y8z4gYy72Td1KHBVFd2dzaVbWmqFSGDCoE3Eo59gRtvMJ5+Zz/RsLIW2
 vALUeHGYIKOtSc3S92HFZ8Q6wbfqgysTHu1S7pgC55QhoxTbKQ+RJjMxeY1UFhn8J+01
 1zDwudOhM1su+EfhDFNexHGQceaxFJMiBSgWLbQuNM05F8UEJbA+jsWYbzIvTj5tP15+
 xVXQ==
X-Gm-Message-State: APjAAAUFo9YVoaAvwk1Z9k9jApBZSCf5h1llBe60prE1V9o9FsFyxg/w
 6uLT5eYSAUcMFSeaFR23NTeLvUC0kno=
X-Google-Smtp-Source: APXvYqzwyPrfA4+WFnYSD5pTKt3myL50dojTfPmN4d57nAOdqAk3ZtWSC3LxgmsRx/FU3ZM+1hOjrQ==
X-Received: by 2002:a6b:f80b:: with SMTP id o11mr1168935ioh.46.1571285505390; 
 Wed, 16 Oct 2019 21:11:45 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com.
 [209.85.166.176])
 by smtp.gmail.com with ESMTPSA id a4sm462614ila.30.2019.10.16.21.11.44
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2019 21:11:45 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id u1so656731ilq.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Oct 2019 21:11:44 -0700 (PDT)
X-Received: by 2002:a92:d652:: with SMTP id x18mr1434259ilp.58.1571285504656; 
 Wed, 16 Oct 2019 21:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191014154626.351-1-daniel.thompson@linaro.org>
 <20191014154626.351-5-daniel.thompson@linaro.org>
In-Reply-To: <20191014154626.351-5-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Oct 2019 21:11:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFMnNdPd_LHYMzRauH=82ZwuwB+QUizLsHT+o4X5q3yA@mail.gmail.com>
Message-ID: <CAD=FV=XFMnNdPd_LHYMzRauH=82ZwuwB+QUizLsHT+o4X5q3yA@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iKx8h-00C0RO-C9
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/5] kdb: Improve handling of
 characters from different input sources
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Oct 14, 2019 at 8:46 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently if an escape timer is interrupted by a character from a
> different input source then the new character is discarded and the
> function returns '\e' (which will be discarded by the level above).
> It is hard to see why this would ever be the desired behaviour.
> Fix this to return the new character rather than the '\e'.
>
> This is a bigger refactor than might be expected because the new
> character needs to go through escape sequence detection.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 39 +++++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 20 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
