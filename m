Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CFD54C309
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 15 Jun 2022 10:02:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1o1Nyi-0005at-Gt
	for lists+kgdb-bugreport@lfdr.de; Wed, 15 Jun 2022 08:02:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pmladek@suse.com>) id 1o1Nyf-0005aM-A1
 for kgdb-bugreport@lists.sourceforge.net; Wed, 15 Jun 2022 08:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DaM9M2rnjrvdQGQ7RvZB3kRvN0KL8OK3uY7jsfFlhwM=; b=bO1eE/OKkFX2JUNd2bm84d2X9I
 lXyhojallxr2VJTWD0R6Oyo8eROmTJ+flS5DYXdeTwAcGxdfc5coC32p93kwQts81iJNquR0+UHAn
 /cJvhOmLn37GAUBx6sUBy8VJCdXJPNBniCRgKM5qooPmMgoRcE6UuYRnca+tBaAYEK+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DaM9M2rnjrvdQGQ7RvZB3kRvN0KL8OK3uY7jsfFlhwM=; b=NSzticEmqsu+DH0BQCl+0jSwJR
 +lI+jzPgkCmz4u9LTD360WcCWqekKFVVDPu2zGoxb+6hL2HuBhERwOkdOy+jLeiuAp373y71Ntfym
 RPFbzmjM/ZzGURtHF/3FtS0HtKkNwapbTpXT5myDBfOpzGiebACDs3vc9jnWK/eit21Y=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o1Nyd-002BoB-HS
 for kgdb-bugreport@lists.sourceforge.net; Wed, 15 Jun 2022 08:02:13 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EB64B21B27;
 Wed, 15 Jun 2022 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1655280119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DaM9M2rnjrvdQGQ7RvZB3kRvN0KL8OK3uY7jsfFlhwM=;
 b=qRtiw/EwzIsZzY7D7oh0BeOfU6iIQ38xDbUtfQXTtdaPPWK3B2vJeEb6IIHEt7MxZ3zKcC
 dfyx4Mc4tIb/eF0FliF28q8hNk+hU2TEYFUekYuM8cDMqgo0Awx7lmNgOzPGeK/9Q2qhBN
 CjKBFgcYgu+XVY7XBl81AW22w0F/oCg=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E39D82C142;
 Wed, 15 Jun 2022 08:01:57 +0000 (UTC)
Date: Wed, 15 Jun 2022 10:01:57 +0200
To: Kees Cook <keescook@chromium.org>
Message-ID: <YqmR9ZeiwMQLyKDu@alley>
References: <CGME20220520083715epcas5p400b11adef4d540756c985feb20ba29bc@epcas5p4.samsung.com>
 <20220520083701.2610975-1-maninder1.s@samsung.com>
 <YonTOL4zC4CytVrn@infradead.org> <202205231238.FAF6D28@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202205231238.FAF6D28@keescook>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2022-05-23 12:39:12, Kees Cook wrote: > On Sat, May
 21, 2022 at 11:07:52PM -0700, Christoph Hellwig wrote: > > On Fri, May 20,
 2022 at 02:06:56PM +0530, Maninder Singh wrote: > > > kallsyms fun [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o1Nyd-002BoB-HS
Subject: Re: [Kgdb-bugreport] [PATCH 0/5] kallsyms: make kallsym APIs more
 safe with scnprintf
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
Cc: peterz@infradead.org, benh@kernel.crashing.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, paulus@samba.org, linux-hexagon@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org,
 daniel.thompson@linaro.org, arnd@arndb.de, linux-scsi@vger.kernel.org,
 onkarnath.1@samsung.com, mpe@ellerman.id.au, anil.s.keshavamurthy@intel.com,
 Christoph Hellwig <hch@infradead.org>, kartilak@cisco.com,
 kgdb-bugreport@lists.sourceforge.net, naveen.n.rao@linux.ibm.com,
 longman@redhat.com, borntraeger@linux.ibm.com, jejb@linux.ibm.com,
 mhiramat@kernel.org, v.narang@samsung.com, satishkh@cisco.com,
 boqun.feng@gmail.com, gor@linux.ibm.com, hca@linux.ibm.com,
 rostedt@goodmis.org, linux-fsdevel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, mingo@redhat.com, bcain@quicinc.com,
 martin.petersen@oracle.com, sebaddel@cisco.com, senozhatsky@chromium.org,
 mcgrof@kernel.org, svens@linux.ibm.com, jason.wessel@windriver.com,
 Maninder Singh <maninder1.s@samsung.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2022-05-23 12:39:12, Kees Cook wrote:
> On Sat, May 21, 2022 at 11:07:52PM -0700, Christoph Hellwig wrote:
> > On Fri, May 20, 2022 at 02:06:56PM +0530, Maninder Singh wrote:
> > > kallsyms functionality depends on KSYM_NAME_LEN directly.
> > > but if user passed array length lesser than it, sprintf
> > > can cause issues of buffer overflow attack.
> > > 
> > > So changing *sprint* and *lookup* APIs in this patch set
> > > to have buffer size as an argument and replacing sprintf with
> > > scnprintf.
> > 
> > This is still a pretty horrible API.  Passing something like
> > a struct seq_buf seems like the much better API here.  Also with
> > the amount of arguments and by reference passing it might be worth
> > to pass them as a structure while you're at it.
> 
> Yeah, I agree. It really seems like seq_buf would be nicer.

There is a new patchset that is trying to use this kind of buffer
in vsprintf.

It introduces another buffer struct because vsprintf() needs a bit
different semantic than the one used in seq_buf. But it actually
replaces seq_buf() in the end. I am not sure if this is the right
approach.

Anyway, the initial API is very simple, see
https://lore.kernel.org/r/20220604193042.1674951-2-kent.overstreet@gmail.com

And it makes the internal vsprintf() API more sane, see
https://lore.kernel.org/r/20220604193042.1674951-4-kent.overstreet@gmail.com

It would eventually solve also concerns about the kallsysms API.
Any comments on the new printbuf API are much appreaciated.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
