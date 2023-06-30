Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D7744540
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  1 Jul 2023 01:36:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qFNej-00013y-3q
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Jun 2023 23:36:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@arndb.de>) id 1qFNeh-00013e-BO
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 23:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Subject:Cc:To:From:Date:References:
 In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=upLBwBc2dBmHKX9v2pXFENlWMqDWFCIobcQ0HEfLYik=; b=aHwnNTpMnjR1oNbfV7arLAlYXC
 8sD8nT4zSpVZECoiGChrlkoY/FSr4C0DMM21o4kv0svIXQf10f3N33ts88Hds5d4ucSlvVE5OBfzo
 dGA+p2qOcuu9h9OHQmew58ceR+sDBKIr6XzILsOVpAGeuG+RCLlhc5Q9xlMmuzPIOhS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Subject:Cc:To:From:Date:References:In-Reply-To:Message-Id:
 Mime-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=upLBwBc2dBmHKX9v2pXFENlWMqDWFCIobcQ0HEfLYik=; b=SduxgCBK42i04rRgZ5c30NHoD2
 S2hnXwFGO40ZaW9vVKH8/FbmxoY6aImRaTr9bGm4gFK9F0e8Hjr45ohxkaMmP7XemnAJYgwTGdtXi
 rId0yzR8qEJCGlJ97zjq5dPzUIMLthWF5FMGwBxzGRVtIEBJpnOYap9WO2zv2OigoJss=;
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qFNef-002WZa-C0 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 23:35:59 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BE81F5C163D;
 Fri, 30 Jun 2023 11:31:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 30 Jun 2023 11:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1688139082; x=1688225482; bh=up
 LBwBc2dBmHKX9v2pXFENlWMqDWFCIobcQ0HEfLYik=; b=IoTcM+BNU5go7enV0u
 JT9XMkqfYa+qdnubg8XHBYF5i2NXlo1fPOir8T9gSOmYLYMpuFSxn3GNQB3AGn+s
 7BfpTods5F9J1kJLl4nO3S61LUPhcF8jfTyqwB04PFuykuZHbHQzPLLzIpKJwqsY
 hBBJpbeQ0+GTse6FIeoTtMMOYvX2Wdbp8itXv7Q4u85pghNbUCeLexA79b/yEXBa
 gChy7+PUrSV/UlYFI1hWbWMoYl0AebKqaEQfVHAu9u8HP12coHAnFnlB81WMvVJ/
 BnRLGVToZB8scM6QJXWLEuZAx2IuhvYExOJUo1NopgYSaDJ3rUFlOQNqx8jaCGD/
 Zhow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688139082; x=1688225482; bh=upLBwBc2dBmHK
 X9v2pXFENlWMqDWFCIobcQ0HEfLYik=; b=dSAPUWjPp1SYx2dhvpDc6kP0C4o9a
 W0kiwUjeRa6rut+EfGy3P42zbh922ribXMJL+v+gMBV6g7YIHyV0LR5X+kGe2kpQ
 eLw8A+ar9zyIpRgI/nin3JlfuNFLpnIwdaHIzSDeEV6uYXns8HDuKaBI2YMzjb+c
 xAYJcOcRvb6oDTMb5iCQCLsr0gcJz+reoQmMio5yGRO6pwKZlRnGdmOvOsHJr2l9
 ZLwm8DcOKLsDabMw5s35yyXcPo9puH1MadTBf4iTeXUK4PxWMt5X2P5Es/gle9gE
 JO3gxF2j0JogtIhvBO+/zMmbU/uZwuEUDbVEs4KGAHBfmmBpTKuM+TEyw==
X-ME-Sender: <xms:SvWeZPVlXpa0WqrDZq4956SnxDgJS3IHYuk4KACxRyH5xAX5-2r1Yw>
 <xme:SvWeZHmjnZGfiKsXuXrI2INfaRI33I7gLBBWnmgLdafkhpL9ECNZAsfGFg56f0qR1
 upnW0lWMmMgBty0170>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeigdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:SvWeZLao6TmHJFrx3m7a1abR0ScevQl2ysVKrgAb1r68RwqxrZmFTg>
 <xmx:SvWeZKXFuzaAkLRaTR5DnB52NF0n1dVGTQ6Hs3XNolHIJNO19SVE_A>
 <xmx:SvWeZJkp5Ye0ibJuLPmUOVfA4COMkNxHhKpMIlnUQQgRsP6oRB5A-w>
 <xmx:SvWeZPX9ipntvWfaN-beytqmFz_yGGpiAJksGvMbhcdHAp-hOL0gCw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2B7DAB60092; Fri, 30 Jun 2023 11:31:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <51b8b3c2-f4ac-454c-acde-e1d136139109@app.fastmail.com>
In-Reply-To: <20230630152439.GA2900969@aspen.lan>
References: <20230517125423.930967-1-arnd@kernel.org>
 <20230630152439.GA2900969@aspen.lan>
Date: Fri, 30 Jun 2023 17:31:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Daniel Thompson" <daniel.thompson@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 30, 2023, at 17:24, Daniel Thompson wrote: > On
 Wed, May 17, 2023 at 02:54:09PM +0200, Arnd Bergmann wrote: >> diff --git
 a/kernel/signal.c b/kernel/signal.c >> index 8f6330f0e9ca..d38df14 [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [66.111.4.29 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [66.111.4.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qFNef-002WZa-C0
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: include header in signal handling
 code
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
Cc: Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 30, 2023, at 17:24, Daniel Thompson wrote:
> On Wed, May 17, 2023 at 02:54:09PM +0200, Arnd Bergmann wrote:
>> diff --git a/kernel/signal.c b/kernel/signal.c
>> index 8f6330f0e9ca..d38df14f71ac 100644
>> --- a/kernel/signal.c
>> +++ b/kernel/signal.c
>> @@ -4780,6 +4780,8 @@ void __init signals_init(void)
>>
>>  #ifdef CONFIG_KGDB_KDB
>>  #include <linux/kdb.h>
>> +#include "debug/kdb/kdb_private.h"
>> +
>
> Isn't is better to move the prototype for kdb_send_sig() into
> linux/kdb.h instead?
>
> That's what other kdb helpers spread across the kernel do
> (kdb_walk_kallsyms() for example).

Right, that is probably better here. Not sure if it's worth
reworking the branch if you already merged it, the difference
seems rather minor.

       Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
