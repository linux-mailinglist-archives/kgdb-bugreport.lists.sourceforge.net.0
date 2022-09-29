Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 027575EFB47
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Sep 2022 18:49:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1odwjK-0008Dl-6j
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 29 Sep 2022 16:49:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1odwjI-0008DW-5J
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 29 Sep 2022 16:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8eShIPYqu7E10XqA1YXAoCftbC0rFatAmpe4+4vsscI=; b=SdUSc1dmJLyHmTXiQVmFJZOwd5
 ptHSScH4heMZG3z5LvNcZcQsuzmPSVDnoETXYyLvZd4bK0+Dga0mLgAbjbd0c1joVxgvUXJg9KLRG
 ruGcpGWTFw/eaGTF6OYVgJoxTBxUjC7wcGRAFoANlDiYNBfcUGfrul1xUy/oYurt1zxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8eShIPYqu7E10XqA1YXAoCftbC0rFatAmpe4+4vsscI=; b=iRpx1mupd82Xpo17VPyhnOSmdE
 fqiTYvZkUEDrUYSBYFZaJCOPBS6ikvJE8CDYq44QZLHpeKrnF91gJi+M1sgcZwSY5jt/7TbgM+zf/
 IwGD7UoVmzjCDDqkscDs4ZYKKlFYp8ofvkmBuuJUWEkvsE4c+m177h2d4WksdZ9wkhlU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1odwjD-0001Kk-MJ for kgdb-bugreport@lists.sourceforge.net;
 Thu, 29 Sep 2022 16:49:44 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 019CD1F8BE;
 Thu, 29 Sep 2022 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1664469220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8eShIPYqu7E10XqA1YXAoCftbC0rFatAmpe4+4vsscI=;
 b=HrytoeWsHGUIH5VJtyPUoJbyv0xaregBL9fpxSePMNf0cHw5nf+aDFmL36YJQ3Jn1YmQyx
 eW5zw2346C+FqG7Q8ICq/meKC/T4wcj0j0RThkBCrDcJvCJ2tPtNO0Qoh6JhVRHBOSmqte
 nBCLwjNhPnV0W1Yoa/c5AWzNQtWFceo=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E2A212C14E;
 Thu, 29 Sep 2022 16:33:38 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:33:35 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <YzXI3ztt3kpMbFt1@alley>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220924000454.3319186-1-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat 2022-09-24 02:10:36, John Ogness wrote: > Hi, > > This
 series is essentially the first 18 patches of tglx's RFC series > [0] with
 only minor changes in comments and commit messages. It's > purp [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1odwjD-0001Kk-MJ
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Aaron Tomlin <atomlin@redhat.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
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

On Sat 2022-09-24 02:10:36, John Ogness wrote:
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
> Thomas Gleixner (18):
>   printk: Make pr_flush() static
>   printk: Declare log_wait properly
>   printk: Remove write only variable nr_ext_console_drivers
>   printk: Remove bogus comment vs. boot consoles
>   printk: Mark __printk percpu data ready __ro_after_init

JFYI, I have pushed the first 5 cleanup patches into printk/linux.git,
branch rework/kthreads. The aim is to get them into 6.1.

The rest of the patchset is still being discussed.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
