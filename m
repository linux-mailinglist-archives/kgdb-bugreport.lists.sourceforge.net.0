Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF44F5A8A9
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 29 Jun 2019 05:17:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hh3ry-00006c-PT
	for lists+kgdb-bugreport@lfdr.de; Sat, 29 Jun 2019 03:17:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jason.wessel@windriver.com>) id 1hh3rx-00006W-TN
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 Jun 2019 03:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cGGp1c2ZR7EXoolT2eLPtaDKcMKR6ToFyyg7Pl+Fh5k=; b=GcvwvZxt8B0cVJaPzIj1OVCZPW
 9YTBzG47zRgjTEzR4VbeRDlevHTIpe2/Z5MyNOIhjIbQfAcAFUp5VTGnJJn9iw4u+NVHWTSsrdGlS
 dfQizxEaaJRplrJSC4k7CkF11oPNpEFbLtvw0WxMQurG+bd5iu79mwFmlWNuGbjfVzzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cGGp1c2ZR7EXoolT2eLPtaDKcMKR6ToFyyg7Pl+Fh5k=; b=h98nz++VbsVi8Ooc0kWvoEIfn1
 A9r1qIM2aPt3HiZ9PQsEURmiM/7OqhXgbmRVWEhxplPXwBL2CMv6BlCYo/Df5FflliDiOxYwUzoRK
 oF+WS0K/vyUTM56kRudBDq4eQ4kk0vYS3uZGZBBMUeZ7+iIVSFmR07qMQqfyhChBDVAA=;
Received: from mail5.windriver.com ([192.103.53.11] helo=mail5.wrs.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hh3s2-001LRP-Le
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 Jun 2019 03:17:48 +0000
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5T3Glmb017436
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Fri, 28 Jun 2019 20:16:57 -0700
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.439.0; Fri, 28 Jun 2019
 20:16:36 -0700
To: Doug Anderson <dianders@google.com>, <kgdb-bugreport@lists.sourceforge.net>
References: <CAD=FV=W5oYiNRQEz4wg-8swR=sq6txWS28HryBkxhCkUXsnNjg@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <391f6bc3-71fb-0330-693d-841e4a15de9b@windriver.com>
Date: Fri, 28 Jun 2019 22:16:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=W5oYiNRQEz4wg-8swR=sq6txWS28HryBkxhCkUXsnNjg@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hh3s2-001LRP-Le
Subject: Re: [Kgdb-bugreport] Entering kdb/kgdb at panic time before CPUs
 are killed?
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 6/28/19 4:17 PM, Doug Anderson wrote:
> I was trying to debug a crash using kdb / kgdb today and ran into a
> problem I've seen before: being unable to get kdb / kgdb to debug one
> of important tasks on the system.  Specifically I was unable to use
> kdb to point to the CPU running the task and there was no shadow CPU
> in kgdb.  Running "ps" in kdb showed:
>
> 0xecc9bd80      111        2  1    0   R  0xecc9c488  kworker/0:1H
>    Error: no saved data for this cpu
>
> I decided to dig a little bit more this time and found that the
> problem appears to be that "panic" stops all CPUs before calling the
> panic notifier and then kdb / kgdb shows the CPU as dead.
>
> I wondered if anyone has given any thought to this problem before.
> Obviously a "fix" is to add a special case for kdb / kgdb in the
> panic() function before the CPUs die, but presumably that will be met
> with resistance.  I'm curious if anyone else has good ideas.
>
>
> -Doug


You could set a breakpoint at panic(), instead of waiting for the notifier.


Jason.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
