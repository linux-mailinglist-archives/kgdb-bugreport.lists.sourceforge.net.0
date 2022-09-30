Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C365F10C6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Sep 2022 19:27:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oeJnJ-0000EV-Dz
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Sep 2022 17:27:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1oeJn3-0000Du-8r
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 17:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QFL6LlhwvZGz/p5H7pzHxGfwk3dZsCKYsSd1m5JM4oM=; b=TeEeMuyU8XzcXoX9ppU+JxhC7p
 b2YAT/ixZ3fEjjXGdwfdYNnQC6NHZh0pSdGq3WL2A0PLlQR9nIl9GVvnHv5n/in4ZVk8GQA5SAEZI
 BT+IC8F7gBEKdZR2FnSXxZcid9JW8zkV1t+wO6MiQaAQFiIKo1ifvLXufIEywBfLbzGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QFL6LlhwvZGz/p5H7pzHxGfwk3dZsCKYsSd1m5JM4oM=; b=KfgscDiuX9sP5HaqKH1RSWChMh
 ZfQoC+zFrHvZn1Jc6H01dhPltAla5UsWGJByDxOk27FfoS9H5V8j1FeVTgWmPQomzQ1gZXxz9Bs5D
 dRXr7oHysa+v8EgM0BQ/xxFB9qcFUAdiceHhnrA9YSz6HKNzU2ww2pbgiaB2zXIaALCs=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oeJnC-0087Mq-Sp for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 17:27:20 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 019271F8B9;
 Fri, 30 Sep 2022 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1664558829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QFL6LlhwvZGz/p5H7pzHxGfwk3dZsCKYsSd1m5JM4oM=;
 b=fVFmnuf1u1KQlPpWHU/orNzNBxCa48mSUZkdDX4xlVMEG3NTwC9YxcZf+MalvdIs8VPDMC
 osCorspvdyRlzuSH6nWTp5FHT9YJrkRNI+xnlBo1Cinbk4bxPlh8r1QOWYUzGwN4Ing/dy
 eTbPx3G/4qET3f0xn+WB1F2qlpsf9P8=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 526442C161;
 Fri, 30 Sep 2022 17:27:08 +0000 (UTC)
Date: Fri, 30 Sep 2022 19:27:04 +0200
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Yzcm6Fb6FJGbspgY@alley>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
 <20220924000454.3319186-11-john.ogness@linutronix.de>
 <CAD=FV=U3m_mVLpWna3pgi4=b7OCzUxmKh666g62zPNaB+6QHUA@mail.gmail.com>
 <YzarXlj1NyFGTC08@alley> <87o7uxugbr.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7uxugbr.fsf@jogness.linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri 2022-09-30 15:50:56,
 John Ogness wrote: > On 2022-09-30, 
 Petr Mladek <pmladek@suse.com> wrote: > > Anyway, what about using the later
 added SRCU walk here? > > After all, this is exactly what R [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
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
X-Headers-End: 1oeJnC-0087Mq-Sp
Subject: Re: [Kgdb-bugreport] [PATCH printk 10/18] kgbd: Pretend that
 console list walk is safe
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Aaron Tomlin <atomlin@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri 2022-09-30 15:50:56, John Ogness wrote:
> On 2022-09-30, Petr Mladek <pmladek@suse.com> wrote:
> > Anyway, what about using the later added SRCU walk here?
> > After all, this is exactly what RCU is for, isn't it?
> 
> So I think a lot of the problems with this series is that SRCU is
> introduced too late. We are debating things in patch 6 that are
> irrelevant by patch 12.

> I will rework the series so that the changes come in the following
> order:
> 
> 1. provide an atomic console_is_enabled()
>
> 2. convert the list to SRCU
> 
> 3. move all iterators from console_lock()/console_trylock() to SRCU
> 
> Step 3 may result in console_lock()/console_trylock() calls disappearing
> or relocating to where they are needed for non-list-synchronization
> purposes.

I agree that introding SRCU as early as possible would
help. The current patchset converts the same code several times...

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
