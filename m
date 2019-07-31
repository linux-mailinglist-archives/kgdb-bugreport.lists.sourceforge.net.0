Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 957C87C925
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 31 Jul 2019 18:49:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hsrnA-00084K-BP
	for lists+kgdb-bugreport@lfdr.de; Wed, 31 Jul 2019 16:49:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jan.kiszka@siemens.com>) id 1hsrn8-00083u-NV
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 16:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9GXJcRukphIX4939v/26gh9U3B69/cSROLBLCGp+woc=; b=Ro+BmW7vHs6lDBB6J9uMKSuc5n
 /Cn5To8vJJXtbg2LiyulXwCfTDi1M+4aQs/9CUYHbDTPwmcMBaD8MpNky6Q8LsjJj1TVDqoIZ694N
 wBLLn/o5jDC0kvSYBN0wfoVOuaXcdu9ocUdnI25tCfE5Pz/Zd96TUTv20zJU11ZXYhmI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9GXJcRukphIX4939v/26gh9U3B69/cSROLBLCGp+woc=; b=XlfPlMFZWclAT3UPZY0PvJ21SQ
 x3gbc21rY9G2i1S1RiHhKOsta6L4Expjj1/LzGVQ/prPewCrgrjmRApVSfJquOzibbL+lozr0dxU2
 OkXWwcLCp5xp8vCAerI/3XHdWbW8SMF5sKmKBtPyh3sVJbXX1dMujp066LQSGGPN75FM=;
Received: from lizzard.sbs.de ([194.138.37.39])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsrn5-005r0q-EF
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 16:49:30 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6VGNsMW016786
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 18:23:54 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may
 be forged))
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6VGNsUO025479;
 Wed, 31 Jul 2019 18:23:54 +0200
To: Doug Anderson <dianders@chromium.org>
References: <20190730234052.148744-1-dianders@chromium.org>
 <34bbd6b5-2e37-159a-b75b-36a6be11c506@siemens.com>
 <CAD=FV=Uqa79UyFFj6zrr_B=rrwfmJAFLLatf8wQ73V70U-frvA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9e3604b2-57dd-7f79-392d-47bb34eb5137@siemens.com>
Date: Wed, 31 Jul 2019 18:23:53 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Uqa79UyFFj6zrr_B=rrwfmJAFLLatf8wQ73V70U-frvA@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hsrn5-005r0q-EF
Subject: Re: [Kgdb-bugreport] [PATCH] scripts/gdb: Handle split debug
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
 kgdb-bugreport@lists.sourceforge.net, Kieran Bingham <kbingham@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 31.07.19 17:44, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 31, 2019 at 7:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 31.07.19 01:40, Douglas Anderson wrote:
>>> Some systems (like Chrome OS) may use "split debug" for kernel
>>> modules.  That means that the debug symbols are in a different file
>>> than the main elf file.  Let's handle that by also searching for debug
>>> symbols that end in ".ko.debug".
>>
>> Is this split-up depending on additional kernel patches, is this already
>> possible with mainline, or is this purely a packaging topic? Wondering because
>> of testability in case it's downstream-only.
> 
> It is a packaging topic.  You can take a normal elf file and split the
> debug out of it using objcopy.  Try "man objcopy" and then take a look
> at the "--only-keep-debug" option.  It'll give you a whole recipe for
> doing splitdebug.  The suffix used for the debug symbols is arbitrary.
> If people have other another suffix besides ".ko.debug" then we could
> presumably support that too...
> 
> For portage (which is the packaging system used by Chrome OS) split
> debug is supported by default (and the suffix is .ko.debug).  ...and
> so in Chrome OS we always get the installed elf files stripped and
> then the symbols stashed away.
> 
> At the moment we don't actually use the normal portage magic to do
> this for the kernel though since it affects our ability to get good
> stack dumps in the kernel.  We instead pass a script as "strip" [1].
> 
> 
> [1] https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/refs/heads/master/eclass/cros-kernel/strip_splitdebug
> 
> 
> -Doug
> 

Thanks, makes perfect sense to me. You may add my

Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
