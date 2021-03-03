Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB332B7F6
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Mar 2021 14:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RGrOWHR+m9PVneOwn68DY79ULNU0Xojglb6+iB7yJO0=; b=Ct1aYD992oF8khi35FYEABHu2
	JCXiF5AEx55uNVnznZU2U2GM+jpO/OOKoAKeIpN+orrtJtjPJF4KEjRtIKXLgvyyGXVY4YHhxtmrw
	xKGl9oTge5wwkBmpi3Hm8pZSRlmHrC1N9G5uLHLjzWVe8wof7NyYN74jTW+DH7tG1H6YU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lHROw-0001pg-L5
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Mar 2021 13:18:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmladek@suse.com>) id 1lHROv-0001pW-1f
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 13:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fTjwCAs8NFhD6G8Me32PjCtQRtajdWLNU8hPxq2kLwY=; b=VwIXSH6KqMSFtQPTeUAXnto2j3
 +pszhzOpIQjRSuwr6itkwwpFTZz9K+kR9bq9kY48aSNOx+IizGT7aiZ8QdCOF4OIf3y2pLDDPJHU2
 eVAQ8CF1VS9l5d4Me3S9QgSZ3PGNRdFHSosRfOlJD3112xaDxHtE+4r2V66lpEG8izhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fTjwCAs8NFhD6G8Me32PjCtQRtajdWLNU8hPxq2kLwY=; b=DU4/nSCEafRgZ3XUoMaqmQ2oFi
 L9BS6TaEt7xNSnPT3RUy5mqZJ9TmdEqHwh7R2ipPMH+QrJGgE4tpHC3iOanPadt83H+iRujBReh4R
 P/RaAmDums+uWQ56HnB0hAKI6HR0aJuNMvQtxB4qnNObFOUfBiVqgl87pBCGfU4EWhkE=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lHROn-0006UB-9i
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Mar 2021 13:18:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614777516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTjwCAs8NFhD6G8Me32PjCtQRtajdWLNU8hPxq2kLwY=;
 b=OG2D8K0+PfCuA5USdfd+Vx6vvOPTyS3EUyRmE7sqZ415QTN8GcaX9NJMw0mxPVVFu1pGLR
 m/nhsBzCaOzVYjLB8Jp0BgoRT32O09qY+clnqr6yXiqa/1CU+6464zYukujhq7ChdCD79P
 71x09r4i/F0vei3pckPBC7HbLpQl/ms=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 531B1AD29;
 Wed,  3 Mar 2021 13:18:36 +0000 (UTC)
Date: Wed, 3 Mar 2021 14:18:29 +0100
To: John Ogness <john.ogness@linutronix.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Message-ID: <YD+MpccJp4gX6bOP@alley>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303101528.29901-1-john.ogness@linutronix.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lHROn-0006UB-9i
Subject: [Kgdb-bugreport] lkml delivery: was: Re: [PATCH next v4 00/15]
 printk: remove logbuf_lock
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 Jordan Niethe <jniethe5@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGkgSm9obiwKCk9uIFdlZCAyMDIxLTAzLTAzIDExOjE1OjEzLCBKb2huIE9nbmVzcyB3cm90ZToK
PiBIZWxsbywKPiAKPiBIZXJlIGlzIHY0IG9mIGEgc2VyaWVzIHRvIHJlbW92ZSBAbG9nYnVmX2xv
Y2ssIGV4cG9zaW5nIHRoZQo+IHJpbmdidWZmZXIgbG9ja2xlc3NseSB0byBib3RoIHJlYWRlcnMg
YW5kIHdyaXRlcnMuIHYzIGlzCj4gaGVyZSBbMF0uCgpIYXZlIHlvdSBnb3Qgc29tZSByZXBseSBm
cm9tIGxrbWwgdGhhdCBpdCBoYXMgbm90IGRlbGl2ZXJlZCB0aGVyZSwKcGxlYXNlPwoKSSBhbSBu
b3QgYWJsZSB0byBnZXQgdGhlIHBhdGNoc2V0IHVzaW5nIGI0IHRvb2w6CgokPiBiNCBhbSAtbyB0
ZXN0IDIwMjEwMzAzMTAxNTI4LjI5OTAxLTEtam9obi5vZ25lc3NAbGludXRyb25peC5kZQpMb29r
aW5nIHVwIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTAzMDMxMDE1MjguMjk5MDEtMS1q
b2huLm9nbmVzcyU0MGxpbnV0cm9uaXguZGUKR3JhYmJpbmcgdGhyZWFkIGZyb20gbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWh5cGVydgpBbmFseXppbmcgMiBtZXNzYWdlcyBpbiB0aGUgdGhyZWFkCi0t
LQpUaHJlYWQgaW5jb21wbGV0ZSwgYXR0ZW1wdGluZyB0byBiYWNrZmlsbApHcmFiYmluZyB0aHJl
YWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcvbGttbApTZXJ2ZXIgcmV0dXJuZWQgYW4gZXJyb3I6IDQw
NApHcmFiYmluZyB0aHJlYWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkClNlcnZlciBy
ZXR1cm5lZCBhbiBlcnJvcjogNDA0CkdyYWJiaW5nIHRocmVhZCBmcm9tIGxvcmUua2VybmVsLm9y
Zy9saW51eHBwYy1kZXYKTG9hZGVkIDIgbWVzc2FnZXMgZnJvbSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eHBwYy1kZXYvCi0tLQpXcml0aW5nIHRlc3QvdjRfMjAyMTAzMDNfam9obl9vZ25l
c3NfcHJpbnRrX3JlbW92ZV9sb2didWZfbG9jay5tYngKICBFUlJPUjogbWlzc2luZyBbMS8xNV0h
CiAgRVJST1I6IG1pc3NpbmcgWzIvMTVdIQogIEVSUk9SOiBtaXNzaW5nIFszLzE1XSEKICBFUlJP
UjogbWlzc2luZyBbNC8xNV0hCiAgRVJST1I6IG1pc3NpbmcgWzUvMTVdIQogIEVSUk9SOiBtaXNz
aW5nIFs2LzE1XSEKICBFUlJPUjogbWlzc2luZyBbNy8xNV0hCiAgRVJST1I6IG1pc3NpbmcgWzgv
MTVdIQogIEVSUk9SOiBtaXNzaW5nIFs5LzE1XSEKICBFUlJPUjogbWlzc2luZyBbMTAvMTVdIQog
IFtQQVRDSCBuZXh0IHY0IDExLzE1XSBwcmludGs6IGttc2dfZHVtcGVyOiByZW1vdmUgQGFjdGl2
ZSBmaWVsZAogIOKckyBbUEFUQ0ggbmV4dCB2NCAxMi8xNV0gcHJpbnRrOiBpbnRyb2R1Y2UgYSBr
bXNnX2R1bXAgaXRlcmF0b3IKICBFUlJPUjogbWlzc2luZyBbMTMvMTVdIQogIFtQQVRDSCBuZXh0
IHY0IDE0LzE1XSBwcmludGs6IGttc2dfZHVtcDogcmVtb3ZlIF9ub2xvY2soKSB2YXJpYW50cwog
IEVSUk9SOiBtaXNzaW5nIFsxNS8xNV0hCi0tLQpUb3RhbCBwYXRjaGVzOiAzCi0tLQpXQVJOSU5H
OiBUaHJlYWQgaW5jb21wbGV0ZSEKQ292ZXI6IHRlc3QvdjRfMjAyMTAzMDNfam9obl9vZ25lc3Nf
cHJpbnRrX3JlbW92ZV9sb2didWZfbG9jay5jb3ZlcgogTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDIxMDMwMzEwMTUyOC4yOTkwMS0xLWpvaG4ub2duZXNzQGxpbnV0cm9uaXguZGUK
IEJhc2U6IG5vdCBmb3VuZAogICAgICAgZ2l0IGFtIHRlc3QvdjRfMjAyMTAzMDNfam9obl9vZ25l
c3NfcHJpbnRrX3JlbW92ZV9sb2didWZfbG9jay5tYngKCgphbmQgSSBkbyBub3Qgc2VlIGl0IGF0
IGxvcmUuIEl0IGhhcyBvbmx5IGZvdW5kIGNvcGllcyBpbiBsaW51eC1oeXBlcnYKYW5kIGxpbnV4
LXBwY2RldiBtYWlsaW5nIGxpc3RzLApzZWUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDIxMDMwMzEwMTUyOC4yOTkwMS0yLWpvaG4ub2duZXNzQGxpbnV0cm9uaXguZGUvCgpCZXN0IFJl
Z2FyZHMsClBldHIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2tnZGItYnVncmVwb3J0Cg==
