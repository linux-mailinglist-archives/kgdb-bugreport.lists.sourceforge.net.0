Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F5512B11
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Apr 2022 07:45:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1njwyP-0002oE-BI
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Apr 2022 05:45:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1njwyO-0002o8-Rw
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Apr 2022 05:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:List-Id:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UK2lGB6HhfTqHPQpXhjFNfcGN5s1f3IXn7iQrNm4BOc=; b=DzajwebczNcMXu8r4bGVtfM38d
 ihCO9l8J04QFVT1H+lAdZwhiXMwiIAy99CEwKx8hbrjBPvo12n2IvPKvHj44r3fwKRm6aIVSVv3xR
 6xNh5RxtLOl4OwREc0Z3tas3T6wd+dmabES3P0AJgGf9TRY599S4FzUCKXHks/g16mjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:
 List-Id:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UK2lGB6HhfTqHPQpXhjFNfcGN5s1f3IXn7iQrNm4BOc=; b=A
 ORuVwSG5Wtr+uqLYHa5Ur69xrpFGMTxKWOU8lCMVzQJxFdwueV8U3RAu0BN2FPh/PVttRMuB2jVrq
 CHueW/rSldYkRgxJ8XxYmT8vQQesS53XlxBDkAJCOb2Sc59zBTe4ZKgeXjdi9zvtiVUjNgiheIqdi
 QUMDCw6BMP7LiCUA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njwyI-0006h1-06
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Apr 2022 05:45:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4AE461CEF;
 Thu, 28 Apr 2022 05:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BFCC385A9;
 Thu, 28 Apr 2022 05:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651124734;
 bh=A3XvUYr/VhPRon0+LWzgmvQmq2CIOL0bUGl/5SAld5g=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=XrWyUQGig/e8RHE8UiuZDaw2PjI5Tla8Tt/fO/NGoMwUGgkLbemXNtVK8R2B7BFIU
 2RBFWDaY3DT+oseiFGHr+Kc1VfMw4vR5KcB4eVTIlfzJSxBAcqKDRoqWu+7aPYi7Nd
 s+3NvpTcwer4un31kiDfb0sFWpnhi7Zjg0BNvbpM=
Date: Thu, 28 Apr 2022 07:45:26 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
Message-ID: <Ymop9jwBWGioF0Da@kroah.com>
References: <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
 <20220408150202.yhn3qppqwm7wzmo3@maple.lan>
 <OSZPR01MB7050BE18BC9E8DA05C00F478EBF29@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 28, 2022 at 02:15:52AM +0000,
 hasegawa-hitomi@fujitsu.com wrote: > Hi Greg, Arnd, and Daniel,
 > > > I understand that it is not appropriate
 to hardcode c. > > How about using __setup() to [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njwyI-0006h1-06
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/1] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Travis <mike.travis@hpe.com>, SoC Team <soc@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Olof Johansson <olof@lixom.net>,
 Jiri Slaby <jirislaby@kernel.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Apr 28, 2022 at 02:15:52AM +0000, hasegawa-hitomi@fujitsu.com wrote:
> Hi Greg, Arnd, and Daniel,
> 
> > I understand that it is not appropriate to hardcode c.
> > How about using __setup() to add a new kernel parameter and allow the admin
> > to specify the sysrq command when booting?
> 
> I have received a lot of advice regarding sysrq, but after some consideration,
> I would like to change to calling panic() directly as in v1 instead of sysrq.

panic() seems good to me!



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
