Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97824A365
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 17:42:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8QE3-00068K-QK
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 15:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david.laight@aculab.com>) id 1k8QE1-00067t-P0
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 15:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FYNDPAPlO7jChzk3Bewbf2BOBDGEoT3K8F+Ec97vKc4=; b=lr/mXE/IHTkRqKGKrBdSV4sBy3
 WBCvA/AG/o0sYXxUIi0chYxmYZsSlZxRC/C911LG6fP9gMKM4mLQWiBGLwLVuHcu6kZnENdRxzjIr
 h1nwUO3cQiAor1yzIwFTds4X/FsGpVqiWpi5sMlOM0wRJUp3idjhwAbn0j+CMyOaDPb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FYNDPAPlO7jChzk3Bewbf2BOBDGEoT3K8F+Ec97vKc4=; b=aLHFw+XJZUZfPtDiFQpGiMP43J
 SPVUNAxaiQZtU5xEUMWqZMKURcwYe7Z1hVX+ZTA9/D+F+B7OZ6Fvl0TzhnY0PqK8vr04ApZjT/2ha
 pHgaoChu0/paAmMHYw05pAy/djTetDB7INePml5GzEgjah2jwE/z/I5b3hRfHAmFi9LA=;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1k8QDw-001ReN-6E
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 15:42:05 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-261-02K0BOUyNletrE0M2eR4fA-1; Wed, 19 Aug 2020 16:41:50 +0100
X-MC-Unique: 02K0BOUyNletrE0M2eR4fA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 19 Aug 2020 16:41:48 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 19 Aug 2020 16:41:48 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Eric W. Biederman'" <ebiederm@xmission.com>, Christian Brauner
 <christian.brauner@ubuntu.com>
Thread-Topic: [PATCH 00/11] Introduce kernel_clone(), kill _do_fork()
Thread-Index: AQHWdjo738I4JRuBMEmE9DxJ3r/Mo6k/jYog
Date: Wed, 19 Aug 2020 15:41:48 +0000
Message-ID: <df7f7e17a730405ea182ec778eec22e1@AcuMS.aculab.com>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
 <20200818174447.GV17456@casper.infradead.org>
 <20200819074340.GW2674@hirez.programming.kicks-ass.net>
 <20200819084556.im5zfpm2iquzvzws@wittgenstein>
 <20200819111851.GY17456@casper.infradead.org>
 <87a6yq222c.fsf@x220.int.ebiederm.org>
 <20200819134629.mvd4nupme7q2hmtz@wittgenstein>
 <87mu2qznlv.fsf@x220.int.ebiederm.org>
In-Reply-To: <87mu2qznlv.fsf@x220.int.ebiederm.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [185.58.86.151 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [185.58.86.151 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k8QDw-001ReN-6E
Subject: Re: [Kgdb-bugreport] [PATCH 00/11] Introduce kernel_clone(),
 kill _do_fork()
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Kars de Jong <jongk@linux-m68k.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Tom
 Zanussi <zanussi@kernel.org>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hewllig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "uclinux-h8-devel@lists.sourceforge.jp"
 <uclinux-h8-devel@lists.sourceforge.jp>, Fenghua
 Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>, Stafford
 Horne <shorne@gmail.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Tony Luck <tony.luck@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Eric W. Biederman
> Sent: 19 August 2020 16:01
...
> >> Further the design decisions of pids keeps us densly using pids.  So I
> >> expect it will be a while before we even come close to using 30 bits of
> >> pid space.
> >
> > Also because it's simply annoying to have to type really large pid
> > numbers on the shell. Yes yes, that's a very privileged
> > developer-centric complaint but it matters when you have to do a quick
> > kill -9. Chromebook users obviously won't care about how large their
> > pids are for sure.
> 
> Actually that is one of the reasons (possibly the primary reason) that
> we have chosen to keep pid numbers dense.

It also helps keep the ps output under 80 cols.

> There may be fewer users of unix shells then their used to be, and we
> may now have pidfds.  But until people stop using pids in shells it is a
> very valid reason to keep them densly packed.

ISTM that the upper limit should be increased automatically
when the number of allocated pids gets large enough that they
are likely to run out (or get reused very quickly).

Does linux have an O(1) (or do I mean o(1)) pid allocator?
Or does it have to do a linear scan to find a gap??

I made the NetBSD pid allocator/lookup use pid_array[pid & mask]
then check the high bits matched (incremented on allocate).
With a FIFO free list through the unused entries.
Fairly easy to double the size and 'unzip' when getting full.
And then allocate extra high bits to keep plenty of free
values in circulation.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
