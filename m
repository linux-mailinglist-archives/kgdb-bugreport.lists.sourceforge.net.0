Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 197BE4F98DB
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Apr 2022 17:00:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ncq64-0001z1-2T
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Apr 2022 15:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1ncq62-0001yr-CO
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 15:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:List-Id:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZXnsnP5eBxVbv4zGamGE1SU77wMjrWzgIlk1Tbw55YM=; b=b9fBOFK28uPYSYH+ZCLUfXd/3v
 BHs+ufWw+xNGohyhcL0byByO/UDygNx/u4JYlQ4H7hXLuXiTjdHFLv80S/+i0/z19LGLJqK+V6/NJ
 cNLI46qqW+ljx7J5qIX1WOGrTas3lt1Gt1rYsBbrUzQ9/dU+2F/qhwykkYKGfl9tp6UI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:
 List-Id:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZXnsnP5eBxVbv4zGamGE1SU77wMjrWzgIlk1Tbw55YM=; b=R
 j7XbIIzDDF+AWi1XPOvBQZ+fQUeVN7R3/gZg2cPhJsxA0Pc6/FEXUaRho2qFndX6+1HuFFdEopxIx
 LotXzu3fAGybRDJ57qSRwWWOI2jf1lwmWFajtfCXSpbd9W4Qq+oDMJEmal5F5W3VqXfcNVC0Wt+LJ
 KoAERzaRkesDE6Ms=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncq5x-009rRW-BK
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 15:00:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 823DDB82BB0;
 Fri,  8 Apr 2022 15:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98262C385A3;
 Fri,  8 Apr 2022 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649429999;
 bh=71U0oqS5DrYUjZ1LnIjF+pi27wgwlYEGUni79PoPFtA=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=w705BcmmICRkgt8T9jA8+rkSN4j69SMumLIkDqMVo7qcGR+S3Zasw9j+sjzr8bPDL
 sWWEfQZYxQPpb93JQpb177dWRLjDH19LdJd0CLdOpagjasvF+VCX+9ewGyL1SOihhy
 zqI/wad3JndwG8QpzUsZOdv5pnRpc1uSACZsfRiM=
Date: Fri, 8 Apr 2022 16:59:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <YlBN7NaWbU50nfGi@kroah.com>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 08, 2022 at 04:49:31PM +0200,
 Arnd Bergmann wrote:
 > On Fri, Apr 8, 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
 > > > > On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergm [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ncq5x-009rRW-BK
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

On Fri, Apr 08, 2022 at 04:49:31PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 8, 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergmann wrote:
> > > On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> > > >
> > > > There is some prior art for this sort of feature. AFAICT SGI UV has a
> > > > similar mechanism that can send an NMI-with-no-side-channel to the
> > > > kernel. The corresponding driver offers a range of actions using a
> > > > module parameter:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
> > > >
> > > > I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> > > > it is just obfuscation. However it is certainly seems attractive to be
> > > > able to reuse handle_sysrq() to provide a more powerful set of actions.
> > >
> > > How about a module parameter that allows picking a sysrq character then?
> >
> > Module parameters are so 1990, as this is a platform device, why not get
> > it from DT?
> 
> This machine doesn't use DT. I suppose the same could be done with an EFI
> variable, but with a module parameter you get the added benefit of having both
> a boot time kernel command line argument, and the option to override it at
> run time.

I thought it was a platform device?  Worst case, make it a sysfs file :)


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
