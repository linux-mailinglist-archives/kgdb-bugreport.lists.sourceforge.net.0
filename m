Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A637A5E88CF
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 24 Sep 2022 08:44:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1obytg-0005IO-O1
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 24 Sep 2022 06:44:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1obyte-0005ID-T6
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 06:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DzLM8pG1Ejp0W/CC//5j4ER9KWH/Lhk1D7muiSAopVo=; b=OX1csibcWEIlLHBljxeJlNDHmn
 8PyUpqRejZGgEGqZiNYSsrbr5jIy/7PsU2LPsDrszf0MmTbS+q8HgVeutHqSTwdcz+pMGHMOHii5U
 8/uWxomZP06uLjvpqJNpm/ndp1kVSJQC3q7QarB62bDPfBcBhy1doDYGX+Zf4okKwaQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DzLM8pG1Ejp0W/CC//5j4ER9KWH/Lhk1D7muiSAopVo=; b=auqmRbeXhRvjOBItVT4p88Pb2E
 xGLi76fIIGlJq+6Darnnp5AF/Pt4efueH7JGKU2l2bsGHzKPO0fqJE4bvLPrEAE+UiUizWZVFNOpH
 6lCy/SHYOl+t+5bBkXZ/2yXJ1jyHz16SjDaz23wG2iGJK2RGpeM+E4DHJIOlwvci9Rdg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obyta-0000bf-Qf for kgdb-bugreport@lists.sourceforge.net;
 Sat, 24 Sep 2022 06:44:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD23960BD6;
 Sat, 24 Sep 2022 06:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B217FC433D6;
 Sat, 24 Sep 2022 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1664001847;
 bh=XU+g1TD85eu+F7lKIDh9lt03VNI1wjjOGHmpCB5PpDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DuBuothuIcm+Rf/8d4hwbhg/hA+Gss6N8vAry1R91LV411DY530k21Lse+D8jK9GG
 RpObjQM3WoK71AFU96BN6LRe54sLdG/uz1FMIPcnkAD74N/BuW+r/s/f/dz+lbhX0r
 cXIqKeTiJ/jKqhCUt4kEWx27bLxhdSydHSx5SXog=
Date: Sat, 24 Sep 2022 08:44:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Yy6nVpd3+yogT5pJ@kroah.com>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220924000454.3319186-1-john.ogness@linutronix.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Sep 24, 2022 at 02:10:36AM +0206, John Ogness wrote:
 > Hi, > > This series is essentially the first 18 patches of tglx's RFC series
 > [0] with only minor changes in comments and commit message [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1obyta-0000bf-Qf
Subject: Re: [Kgdb-bugreport] [PATCH printk 00/18] preparation for
 threaded/atomic printing
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-parisc@vger.kernel.org,
 Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Aaron Tomlin <atomlin@redhat.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, John David Anglin <dave.anglin@bell.net>,
 Jiri Slaby <jirislaby@kernel.org>, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, Sep 24, 2022 at 02:10:36AM +0206, John Ogness wrote:
> Hi,
> 
> This series is essentially the first 18 patches of tglx's RFC series
> [0] with only minor changes in comments and commit messages. It's
> purpose is to lay the groundwork for the upcoming threaded/atomic
> console printing posted as the RFC series and demonstrated at
> LPC2022 [1].
> 
> This series is interesting for mainline because it cleans up various
> code and documentation quirks discovered while working on the new
> console printing implementation.
> 
> Aside from cleanups, the main features introduced here are:
> 
> - Converts the console's DIY linked list implementation to hlist.
> 
> - Introduces a console list lock (mutex) so that readers (such as
>   /proc/consoles) can safely iterate the consoles without blocking
>   console printing.
> 
> - Adds SRCU support to the console list to prepare for safe console
>   list iterating from any context.
> 
> - Refactors buffer handling to prepare for per-console, per-cpu,
>   per-context atomic printing.
> 
> The series has the following parts:
> 
>    Patches  1 - 5:   Cleanups
> 
>    Patches  6 - 12:  Locking and list conversion
> 
>    Patches 13 - 18:  Improved output buffer handling to prepare for
>                      code sharing
> 

These all look great to me, thanks for resending them.

Do you want them to go through my serial/tty tree, or is there some
other tree to take them through (printk?)

If they are to go through someone else's tree, feel free to add:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
