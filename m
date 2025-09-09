Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF00FB4A457
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Sep 2025 09:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4oiX4yJ7bpQ9RMQYMrov0TDRTqygXYNY/NHt2tuSwo=; b=ES5WcC5EGx6GSFVz8St0LlSISO
	jVaIZoHrohDvX6aphPvyHQScr5i8fRMsvsa9SAvquGGhzGNy+Kih/GQuhA8UOYKqByZJLZ1n1GE0n
	NgwZ4Ll3BCgpD+EQw5X9yGhPha50dm82L653phuHYv0qAubGlehl04UMRMZrM1FNMy+U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uvtE3-0002ZL-LR
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Sep 2025 07:57:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uvtE1-0002ZE-Pd
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 07:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LlA4fNeih3Yuh862kDvLzQfFmFoDZ1djlkzFIKbBwH0=; b=V3xkYQL05/bjR830E+zrZV9SyS
 N4QYIPP1mYIi6lOZ7eiL+IWynR8Kfabew6m9FONpZlW8xHz1ozrOLz4mzNleqIRG++K8tTG8Wd4jf
 KJzr9bsBBoGumyrce+guaDKHs3MIjxPIeUoqa/3EpE75gWB5709RpssZYyfncsmZamcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LlA4fNeih3Yuh862kDvLzQfFmFoDZ1djlkzFIKbBwH0=; b=GpdZwm5yPnrmJFEIaaBBBFc2aU
 upUhmbsuQG1qs3gXmg3UjtgdjQea6D66oYX5A+4j/3DonrVzFSttDqRsnwhGl1toGRAtzjEIQM6zc
 up1dtGLpdsTNMUgyrUWFqGpr+b2p4E6WbQ3OzkqDlhcdt+d2P5mi2LfjeGUXdb/jjL+g=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvtE0-0002zT-Sq for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Sep 2025 07:57:13 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1757404626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlA4fNeih3Yuh862kDvLzQfFmFoDZ1djlkzFIKbBwH0=;
 b=pir1gPcGIuy/zUO83ooLypux2Pokq5tlqGwL6Ruxaff1BdVT7P1L7b9wVsuEU2GQSWZnfh
 znaZszpwMIvUndwHgNI2Z3MWO8E3IoQag14zrz7YfJN15RkwxfEut79XgJGUjWPrQYkWJd
 r7YwAMs5co40OG+YZTQitJ3InvEc3p4Oa8N/UT2WEyuxswQlkCFtK5xGf05JAViNjN8GGg
 ngSjHq1eMIrN9fJUC9vNORfWreWrMDsDUNzdcmaqXi2hhzQuGhmObWjLEQFLBaWrTdTE/f
 sjKqyDhmBu1CWOrtwNaEms/MiutsE9D6x0xdu7xe1agClyoY6uko9kvTRvs3sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1757404626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlA4fNeih3Yuh862kDvLzQfFmFoDZ1djlkzFIKbBwH0=;
 b=633o4RpSGY9ffnBY2DE7J3M9XmJxcJVm8kdqos4GNAGGqBwpJeW3m3Dtgg1fwYBSwIMulv
 Jdhm+5d/J9DjdEDw==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Petr Mladek <pmladek@suse.com>
In-Reply-To: <d73e8cc0259c140a0a49f670c6c165bb662281ed.camel@suse.com>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-4-cd30a8106f1c@suse.com>
 <aL77aq4gZBsn4epT@pathway.suse.cz>
 <d73e8cc0259c140a0a49f670c6c165bb662281ed.camel@suse.com>
Date: Tue, 09 Sep 2025 10:03:05 +0206
Message-ID: <84segwjbxq.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-08, Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: >> > --- a/kernel/debug/kdb/kdb_io.c >> > +++
 b/kernel/debug/kdb/kdb_io.c
 >> > @@ -589,24 +589,40 @@ static void kdb_msg_write(const ch [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1uvtE0-0002zT-Sq
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gMjAyNS0wOS0wOCwgTWFyY29zIFBhdWxvIGRlIFNvdXphIDxtcGRlc291emFAc3VzZS5jb20+
IHdyb3RlOgo+PiA+IC0tLSBhL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMKPj4gPiArKysgYi9r
ZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCj4+ID4gQEAgLTU4OSwyNCArNTg5LDQwIEBAIHN0YXRp
YyB2b2lkIGtkYl9tc2dfd3JpdGUoY29uc3QgY2hhciAqbXNnLAo+PiA+IGludCBtc2dfbGVuKQo+
PiA+IMKgCSAqLwo+PiA+IMKgCWNvb2tpZSA9IGNvbnNvbGVfc3JjdV9yZWFkX2xvY2soKTsKPj4g
PiDCoAlmb3JfZWFjaF9jb25zb2xlX3NyY3UoYykgewo+PiA+IC0JCWlmICghKGNvbnNvbGVfc3Jj
dV9yZWFkX2ZsYWdzKGMpICYgQ09OX0VOQUJMRUQpKQo+PiA+ICsJCXN0cnVjdCBuYmNvbl93cml0
ZV9jb250ZXh0IHdjdHh0ID0geyB9Owo+PiA+ICsJCXNob3J0IGZsYWdzID0gY29uc29sZV9zcmN1
X3JlYWRfZmxhZ3MoYyk7Cj4+ID4gKwo+PiA+ICsJCWlmICghY29uc29sZV9pc191c2FibGUoYywg
ZmxhZ3MsIHRydWUpKQo+PiA+IMKgCQkJY29udGludWU7Cj4+ID4gwqAJCWlmIChjID09IGRiZ19p
b19vcHMtPmNvbnMpCj4+ID4gwqAJCQljb250aW51ZTsKPj4gPiAtCQlpZiAoIWMtPndyaXRlKQo+
PiA+IC0JCQljb250aW51ZTsKPj4gPiAtCQkvKgo+PiA+IC0JCSAqIFNldCBvb3BzX2luX3Byb2dy
ZXNzIHRvIGVuY291cmFnZSB0aGUgY29uc29sZQo+PiA+IGRyaXZlcnMgdG8KPj4gPiAtCQkgKiBk
aXNyZWdhcmQgdGhlaXIgaW50ZXJuYWwgc3BpbiBsb2NrczogaW4gdGhlCj4+ID4gY3VycmVudCBj
YWxsaW5nCj4+ID4gLQkJICogY29udGV4dCB0aGUgcmlzayBvZiBkZWFkbG9jayBpcyBhIGJpZ2dl
cgo+PiA+IHByb2JsZW0gdGhhbiByaXNrcwo+PiA+IC0JCSAqIGR1ZSB0byByZS1lbnRlcmluZyB0
aGUgY29uc29sZSBkcml2ZXIuIFdlCj4+ID4gb3BlcmF0ZSBkaXJlY3RseSBvbgo+PiA+IC0JCSAq
IG9vcHNfaW5fcHJvZ3Jlc3MgcmF0aGVyIHRoYW4gdXNpbmcKPj4gPiBidXN0X3NwaW5sb2Nrcygp
IGJlY2F1c2UKPj4gPiAtCQkgKiB0aGUgY2FsbHMgYnVzdF9zcGlubG9ja3MoKSBtYWtlcyBvbiBl
eGl0IGFyZQo+PiA+IG5vdCBhcHByb3ByaWF0ZQo+PiA+IC0JCSAqIGZvciB0aGlzIGNhbGxpbmcg
Y29udGV4dC4KPj4gPiAtCQkgKi8KPj4gPiAtCQkrK29vcHNfaW5fcHJvZ3Jlc3M7Cj4+ID4gLQkJ
Yy0+d3JpdGUoYywgbXNnLCBtc2dfbGVuKTsKPj4gPiAtCQktLW9vcHNfaW5fcHJvZ3Jlc3M7Cj4+
ID4gKwo+PiA+ICsJCWlmIChmbGFncyAmIENPTl9OQkNPTikgewo+PiA+ICsJCQkvKgo+PiA+ICsJ
CQkgKiBEbyBub3QgY29udGludWUgaWYgdGhlIGNvbnNvbGUgaXMgTkJDT04KPj4gPiBhbmQgdGhl
IGNvbnRleHQKPj4gPiArCQkJICogY2FuJ3QgYmUgYWNxdWlyZWQuCj4+ID4gKwkJCSAqLwo+PiA+
ICsJCQlpZiAoIW5iY29uX2tkYl90cnlfYWNxdWlyZShjLCAmd2N0eHQpKQo+PiA+ICsJCQkJY29u
dGludWU7Cj4+ID4gKwo+PiA+ICsJCQl3Y3R4dC5vdXRidWYgPSAoY2hhciAqKW1zZzsKPj4gPiAr
CQkJd2N0eHQubGVuID0gbXNnX2xlbjsKPj4gCj4+IEkgZG91YmxlIGNoZWNrZWQgd2hldGhlciB3
ZSBpbml0aWFsaXplZCBhbGwgbWVtYmVycyBvZiB0aGUgc3RydWN0dXJlCj4+IGNvcnJlY3RseS4g
QW5kIEkgZm91bmQgdGhhdCB3ZSBkaWRuJ3QuIFdlIHNob3VsZCBjYWxsIGhlcmU6Cj4+IAo+PiAJ
CQluYmNvbl93cml0ZV9jb250ZXh0X3NldF9idWYoJndjdHh0LAo+PiAJCQkJCQnCoMKgwqAgJnBt
c2cucGJ1ZnMtCj4+ID5vdXRidWZbMF0sCj4+IAkJCQkJCcKgwqDCoAo+PiBwbXNnLm91dGJ1Zl9s
ZW4pOwoKTmljZSBjYXRjaC4KCj4+IFNpZ2gsIHRoaXMgaXMgZWFzeSB0byBtaXNzLiBJIHJlbWVt
YmVyIHRoYXQgSSB3YXMgbm90IHN1cGVyIGhhcHB5Cj4+IGFib3V0IHRoaXMgZGVzaWduLiBCdXQg
dGhlIG9yaWdpbmFsIGNvZGUgaW5pdGlhbGl6ZWQgdGhlIHN0cnVjdHVyZQo+PiBvbiBhIHNpbmds
ZSBwbGFjZS4uLgo+Cj4gT2ssIHNvIEknbGwgbmVlZCB0byBhbHNvIGV4cG9ydCBuYmNvbl93cml0
ZV9jb250ZXh0X3NldF9idWYsIHNpbmNlIGl0J3MKPiBjdXJyZW50bHkgc3RhdGljIGluc2lkZSBr
ZXJuZWwvcHJpbnRrL25iY29uLmMuIEknbGwgZG8gaXQgZm9yIHRoZSBuZXh0Cj4gdmVyc2lvbi4K
CkhvdyBhYm91dCBtb2RpZnlpbmcgbmJjb25fa2RiX3RyeV9hY3F1aXJlKCkgdG8gYWxzbyB0YWtl
IEBtc2cgYW5kCkBtc2dfbGVuLiBUaGVuLCBvbiBzdWNjZXNzLCBAd2N0eHQgaXMgYWxyZWFkeSBw
cmVwYXJlZC4gSSBkbyBub3QgbGlrZQp0aGUgaWRlYSBvZiBleHRlcm5hbCBjb2RlIGZpZGRsaW5n
IHdpdGggdGhlIGZpZWxkcy4KCkpvaG4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBv
cnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
