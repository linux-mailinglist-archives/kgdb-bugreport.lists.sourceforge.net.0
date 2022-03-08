Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B44D2335
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Mar 2022 22:20:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRhFn-000855-R3
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Mar 2022 21:20:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rdunlap@infradead.org>) id 1nRhFl-00084x-16
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 21:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j5ZN+IAAztFuJh5l3U8Vq4bOu5JLU5wwE3OHp1I+9yI=; b=hOG/GePHBYdWMPRKYmY7S79IeT
 16J4MwbJNO2DPMBqEr5yMqSnukpMBUM/TCXivKE6AcON91U45VFLOw4XU9IZ6pVsEFec3YKuhKf/T
 RG86nhcRl8LnAf736A8x2/eg9im2tsZQw3s0YS/x7RQVqG5ra7mdLcMyByCxUqprsdVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j5ZN+IAAztFuJh5l3U8Vq4bOu5JLU5wwE3OHp1I+9yI=; b=C/kFSHWoVjA3GKitkJklQBjm+7
 iixtp9p7GbY8UOmu7pfE0F0oRQQ6yCHYVCAhR/2zcGvmUpOmvKYh2EUHBwu9AGFEWMwjOUB9gkJ3x
 S/cUOaXs01ld2cMMc2ym+nfXQQ0Mu5VucuHetUIPit4KY4P1eF+REw5SBMQxAFfoIbek=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRhFg-0090sE-Sp
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 21:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=j5ZN+IAAztFuJh5l3U8Vq4bOu5JLU5wwE3OHp1I+9yI=; b=HwyoKhKApYaXBedHXnuWl0gtXV
 eKn/R+yVkngBQ2GQPnCK/wuZdfEfRp2ViEuojc2qjuYB+9CGS2pd14fXjEq6UotWssFPLjMO/w+xp
 DILk4bcdfsIg2zPevmsQXAqfW7scXXPS0zklQG9SykPjdPLeD+y6xZEGxmqeQMXCLah07iQrq+C76
 y2LN1lB/dGn1AutHT0oj/F3k1M/ybqYO/sHC9gB8RXZ0J0/YmyLgcEk0KRT7PMUCCj/TP8sFsfdsI
 P9327bWYcE3i3cg5h54TsD/NMnjiy/0kYwJ+qv7zeomvgqxRhPeBw//zKS2dTxEmd0E+giXlDcyYn
 Naj0D4sg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRhFB-00GXvJ-IX; Tue, 08 Mar 2022 21:19:46 +0000
Message-ID: <2c693cb8-f4b8-a723-c804-9492d9cc4881@infradead.org>
Date: Tue, 8 Mar 2022 13:19:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20220308033241.22099-1-rdunlap@infradead.org>
 <CAD=FV=W90Hd-baPzurraEaDUGNOCxb8FLUysHKOQg2frMuZRAQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAD=FV=W90Hd-baPzurraEaDUGNOCxb8FLUysHKOQg2frMuZRAQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Doug, On 3/8/22 08:04, Doug Anderson wrote: > Hi, > > On
 Mon, Mar 7, 2022 at 7:32 PM Randy Dunlap <rdunlap@infradead.org> wrote: >>
 >> __setup() handlers should return 1 to indicate that the boot option >>
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nRhFg-0090sE-Sp
Subject: Re: [Kgdb-bugreport] [PATCH] kgdboc: fix return value of __setup
 handler
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Igor Zhbanov <i.zhbanov@omprussia.ru>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laura Abbott <labbott@redhat.com>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Doug,

On 3/8/22 08:04, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 7, 2022 at 7:32 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> __setup() handlers should return 1 to indicate that the boot option
>> has been handled. A return of 0 causes the boot option/value to be
>> listed as an Unknown kernel parameter and added to init's (limited)
>> environment strings. So return 1 from kgdboc_option_setup().
> 
> This took me about 20 minutes to trace through the code to confirm,
> but it appears you're correct. It's pretty twisted that early_param()
> and __setup(), both of which add things to the same list, work exactly
> opposite here. :( Any chance I could convince you to:
> 
> 1. Add a comment before the definition of __setup_param() explaining
> that 0 means error and 1 means no error. There's a comment next to
> early_param() that _implies_ that setup is the opposite(), but it'd be
> nice to see documentation of __setup(). I know __setup() is supposed
> to be "only for core code", but still seems like we could document it.

I have already done this. The patch is in Andrew's mmotm tree (patch queue).

> 2. Add something to your commit message helping someone find the place
> where the return value is checked. Basically just mention
> obsolete_checksetup() to give people a hint.
> 

Sure, no problem. Good idea.

> 
>> Unknown kernel command line parameters "BOOT_IMAGE=/boot/bzImage-517rc7
>>   kgdboc=kbd kgdbts=", will be passed to user space.
>>
>>  Run /sbin/init as init process
>>    with arguments:
>>      /sbin/init
>>    with environment:
>>      HOME=/
>>      TERM=linux
>>      BOOT_IMAGE=/boot/bzImage-517rc7
>>      kgdboc=kbd
>>      kgdbts=
>>
>> Fixes: 1cd25cbb2fed ("kgdboc: Fix warning with module build")
> 
> Are you certain about this "Fixes" line? That commit was just code
> motion to move the code inside the #ifdef. It sure looks like it was
> broken even before this.
> 

Yes, but I am not enough of a git user to be able to backtrack
to see where this code was added. :(
(help?)

> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: Igor Zhbanov <i.zhbanov@omprussia.ru>
>> Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
>> Cc: Laura Abbott <labbott@redhat.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Jiri Slaby <jirislaby@kernel.org>
>> Cc: kgdb-bugreport@lists.sourceforge.net
>> Cc: Jason Wessel <jason.wessel@windriver.com>
>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>> Cc: Douglas Anderson <dianders@chromium.org>
>> Cc: linux-serial@vger.kernel.org
>> ---
>>  drivers/tty/serial/kgdboc.c |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> --- lnx-517-rc7.orig/drivers/tty/serial/kgdboc.c
>> +++ lnx-517-rc7/drivers/tty/serial/kgdboc.c
>> @@ -403,16 +403,16 @@ static int kgdboc_option_setup(char *opt
>>  {
>>         if (!opt) {
>>                 pr_err("config string not provided\n");
>> -               return -EINVAL;
>> +               return 1;
> 
> Shouldn't it return 0 in the error cases? If __setup() functions are
> supposed to return "1" no matter what then what was the purpose of
> having a return value in the first place?

It should return 0 if the string(s) should be added to init's arg or env
strings, which is probably very rare. I don't know why it has a return
value in the first place. Someone else has already suggested that __setup()
functions should be void. Maybe they should one day, but that's a much
larger patch.

I'll send a v2.

thanks.
-- 
~Randy


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
