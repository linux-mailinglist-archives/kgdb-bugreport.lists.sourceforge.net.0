Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 540F74F97E7
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Apr 2022 16:21:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ncpUZ-0000sA-Rm
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Apr 2022 14:21:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1ncpUZ-0000s4-4u
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 14:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:List-Id:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eGlefB1trgKzODlm+7LAR5Zg+GXVlyuxNCXC9xgQ/fg=; b=ldCRD9WD47d0iy9SgcooR7EacS
 /151C4kUB0shMC4pme060DWYn665xX7VDrD7gUtlu3WR6roSi7ioOVn9pYq3auE6mAE53z1O6jIBf
 m8p19C+o7FnffMv7PUdVsUKUn3Oci1aGAh+AsLo8n3bfrOscSk4OMMOcBJl/RU8GfbZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:
 List-Id:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eGlefB1trgKzODlm+7LAR5Zg+GXVlyuxNCXC9xgQ/fg=; b=P
 K15AOZ5M9lSsoVVnYOTqM1AQDhnINsMKGShMR+Rg44BFIPXToKoPhO0srkkvXNVWapir3tydYEk22
 q4L6A4zLQMPnVlR3myh28HNJjPk+r+eDenzwWH2EgXh3aeMOqvf+edp+aEu51z35VM5P2KHfqaqhs
 phiP4sVFmX5w49qM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncpUZ-00022C-9k
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 14:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE94861D7C;
 Fri,  8 Apr 2022 14:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2305C385A1;
 Fri,  8 Apr 2022 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649427693;
 bh=edq7OdYVz/fakxKeJpIVUrOb+T9ycg4WI+W/yqLhc44=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=U7peKTozc7StMJJXy8fMkcdUS69Y1nygwp+89/nGo6O1uRpGfWWbGCHREb2I0PP9L
 3LUyZxwyNUopn+9EBYQcOaKWWGaBlNg1N/oztNaL8/4iWuGnODhbRVNgzDHwfLIqXr
 FEyGxDcLSj5E5f1YeIS0UWgLkEeTf4c0Oa1fEino=
Date: Fri, 8 Apr 2022 16:21:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <YlBE6hZHmLo9/wrU@kroah.com>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 08, 2022 at 04:17:16PM +0200,
 Arnd Bergmann wrote:
 > On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson > <daniel.thompson@linaro.org>
 wrote: > > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ncpUZ-00022C-9k
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Travis <mike.travis@hpe.com>, SoC Team <soc@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> >
> > There is some prior art for this sort of feature. AFAICT SGI UV has a
> > similar mechanism that can send an NMI-with-no-side-channel to the
> > kernel. The corresponding driver offers a range of actions using a
> > module parameter:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
> >
> > I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> > it is just obfuscation. However it is certainly seems attractive to be
> > able to reuse handle_sysrq() to provide a more powerful set of actions.
> 
> How about a module parameter that allows picking a sysrq character then?

Module parameters are so 1990, as this is a platform device, why not get
it from DT?

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
