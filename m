Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD3220E733
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jun 2020 00:10:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jq1z5-0000v8-3F
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 22:10:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cengiz@kernel.wtf>) id 1jq1yy-0000uu-MP
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 22:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Date:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVLc3zonLFO9f5Fm8kzfIUI4UYbR8WgB+WNIp0DSlqA=; b=Hx+L0J9gv9bed0zBYJ+gOMimyD
 bffrWsIHn7pMZXynInzLX77QPgFhkWaPcb8t1Uu+oAE3+BLqjA4EFzFQOXIL+MRb5W1a1Z4R6bmO4
 6P1URL7M9dgoAU2Ifd0ecBdUVYpFMfUmPftni3t4stCEt32TT2/kMMkFyxnNG5Ondn1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Date:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lVLc3zonLFO9f5Fm8kzfIUI4UYbR8WgB+WNIp0DSlqA=; b=YVEcIOF17XxVtVKF6+uae3oFwm
 wVBIwvGMWHW0Wa+gPEgfTmiZQwKPxqBptP1qa3Zm7YdT+0/09sR8QfmVoBicdRy9tFOCIFZssVROM
 E8iZ9tc6eUW+orFz0g4Fn6Xx+ftxszG9BCRC5OjrQurgDxyN1riSeyYXo7e2ElrimHQU=;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jq1yw-005Qkk-C5
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 22:10:32 +0000
X-Originating-IP: 176.88.144.104
Received: from [192.168.1.4] (unknown [176.88.144.104])
 (Authenticated sender: cengiz@kernel.wtf)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 29A3A20007;
 Mon, 29 Jun 2020 22:10:20 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Jun 2020 01:10:19 +0300
Message-ID: <173022188f8.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
In-Reply-To: <CAD=FV=XWYKqHEMDt-0PYHty_syJ9MO6Oz8DVBbacNZS5zGXk9A@mail.gmail.com>
References: <20200629153756.cxg74nec3repa4lu@holly.lan>
 <20200629205012.3263-1-cengiz@kernel.wtf>
 <CAD=FV=XWYKqHEMDt-0PYHty_syJ9MO6Oz8DVBbacNZS5zGXk9A@mail.gmail.com>
User-Agent: AquaMail/1.25.0-1628 (build: 102500003)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jq1yw-005Qkk-C5
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: remove unnecessary null check
 of dbg_io_ops
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


On June 30, 2020 00:16:54 Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Mon, Jun 29, 2020 at 1:50 PM Cengiz Can <cengiz@kernel.wtf> wrote:
>>
>> `kdb_msg_write` operates on a global `struct kgdb_io *` called
>> `dbg_io_ops`.
>>
>> It's initialized in `debug_core.c` and checked throughout the debug
>> flow.
>>
>> There's a null check in `kdb_msg_write` which triggers static analyzers
>> and gives the (almost entirely wrong) impression that it can be null.
>>
>> Coverity scanner caught this as CID 1465042.
>>
>> I have removed the unnecessary null check and eliminated false-positive
>> forward null dereference warning.
>>
>> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
>> ---
>> kernel/debug/kdb/kdb_io.c | 12 +++++-------
>> 1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
>> index 683a799618ad..4ac59a4fbeec 100644
>> --- a/kernel/debug/kdb/kdb_io.c
>> +++ b/kernel/debug/kdb/kdb_io.c
>> @@ -549,14 +549,12 @@ static void kdb_msg_write(const char *msg, int msg_len)
>> if (msg_len == 0)
>>        return;
>>
>> -       if (dbg_io_ops) {
>> -               const char *cp = msg;
>> -               int len = msg_len;
>> +       const char *cp = msg;
>> +       int len = msg_len;
>
> kernel/debug/kdb/kdb_io.c:552:14:
> warning: ISO C90 forbids mixing declarations and code
> [-Wdeclaration-after-statement]

Oops!

Sorry for that..

I admit I didn't compile check my second attempt.

/me ducks and covers

Will fix it asap.

Thanks!

>
> -Doug





_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
