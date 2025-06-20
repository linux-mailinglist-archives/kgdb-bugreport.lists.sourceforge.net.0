Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23092AE1E15
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 Jun 2025 17:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYipas0MKuIqzS+GEdNbACIZFmPOdjw/ZOny7UjceQM=; b=K9Fw3GTMKeoSfokDpKDKmcJn0i
	cc7Bf3gbuWTki/HBRxNnwP6qWeg2Xd0YO82r+kqCpulLgEXIzr8bs/314acgxYXRTKZBRaGav5qa3
	Zemp8DxbbyYQ7PmH8ZSHT3CbsfDyW8NHD0IAj3nzJ2WTp99AHwbIa5WG04+LYm7z9Vlw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uSdLm-0000lx-0E
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 20 Jun 2025 15:08:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uSdLk-0000lq-7S
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 20 Jun 2025 15:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zf9eZNGS/J7cqsYhd+Ez8QubB3SKjLSoDlWDiWnAjOA=; b=IT7TeFI16t4mCQ50Rk0Fedarwg
 l0pbdSqjTg7fD5jobSJRZ58xco1stDCSYs7H0aFsqWpRXGnXtMMrLveatibIJjs4BiMs+1YBaGV26
 /k8SuHvGOhCq7FT3Emcq+VR7ibUKG447DRdeK3ti2QY91Re8nlDqrJ7NQeAE/dmF6qqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zf9eZNGS/J7cqsYhd+Ez8QubB3SKjLSoDlWDiWnAjOA=; b=aNC2oZqRInX1imq0bYxIedx32q
 teNzMUn1nGlBcyDY6bGafHtnU1nwHkIAhA6HCfsyTSO462ho7jiD8H7WXSvjo/81ShtCUk5HOGMpG
 o9r4r3pi+hwF6P83Dxta0D6f35m7+qLCv0OZG+SQmWOeL0p1j7MfdTvEZ/s9POoKjBAg=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uSdLj-0003YV-C4 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 20 Jun 2025 15:08:16 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1750430588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zf9eZNGS/J7cqsYhd+Ez8QubB3SKjLSoDlWDiWnAjOA=;
 b=hb5o0dc5GvKPdYV2/5l5iL+pdghzJ2cRGQIbp7KrHSBtdO/MvYQA9hh0euy5xWrNs0MPpg
 RJU0iL6518QlFrA1pAP7KYd/L+m8HX1RZQSqEWaVhhxDWnphvEtVas/jU/v33PqkNo4p/w
 40jWxyWIXW6IBniJKMlSY3cetMBiJcGrOnGX2Xs2vHEHEUTXEVlDpZytucx+jIxnwveFTq
 BZJA1eQMDblJv1+5SDfDNEMJchkbmNGr27nSwY6VaSoVmE9guI6vTlXJWRplUxCfPC/7ww
 RlS3OC5noZq6jer3COwBLhR0eLTaieuys/mBmz0Ws3fNPoPKuu/Is+R12ktaFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1750430588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zf9eZNGS/J7cqsYhd+Ez8QubB3SKjLSoDlWDiWnAjOA=;
 b=GK+xBRhvIL3VuhN/qjyFnX59zi7Ek/5vSo7O6W52qAcr05hqeOrgmxcBFIwe5uMC0oARw/
 vIV++n1IzWc76PCQ==
To: Petr Mladek <pmladek@suse.com>, Marcos Paulo de Souza <mpdesouza@suse.com>
In-Reply-To: <aExBo-8cVOy6GegR@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-2-f427c743dda0@suse.com>
 <aExBo-8cVOy6GegR@pathway.suse.cz>
Date: Fri, 20 Jun 2025 16:49:07 +0206
Message-ID: <84y0tmiidg.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-06-13, Petr Mladek <pmladek@suse.com> wrote: >> diff
 --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c >> index
 fd12efcc4aeda8883773d9807bc215f6e5cdf71a..72de12396e6f1bc5234acfdf6dcc393acf
 [...] Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1uSdLj-0003YV-C4
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] printk: Use consoles_suspended
 flag when suspending/resuming all consoles
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
Cc: Richard Weinberger <richard@nod.at>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gMjAyNS0wNi0xMywgUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+IHdyb3RlOgo+PiBk
aWZmIC0tZ2l0IGEva2VybmVsL3ByaW50ay9uYmNvbi5jIGIva2VybmVsL3ByaW50ay9uYmNvbi5j
Cj4+IGluZGV4IGZkMTJlZmNjNGFlZGE4ODgzNzczZDk4MDdiYzIxNWY2ZTVjZGY3MWEuLjcyZGUx
MjM5NmU2ZjFiYzUyMzRhY2ZkZjZkY2MzOTNhY2Y4OGQyMTYgMTAwNjQ0Cj4+IC0tLSBhL2tlcm5l
bC9wcmludGsvbmJjb24uYwo+PiArKysgYi9rZXJuZWwvcHJpbnRrL25iY29uLmMKPj4gQEAgLTEx
NDcsNyArMTE0Nyw3IEBAIHN0YXRpYyBib29sIG5iY29uX2t0aHJlYWRfc2hvdWxkX3dha2V1cChz
dHJ1Y3QgY29uc29sZSAqY29uLCBzdHJ1Y3QgbmJjb25fY29udGV4Cj4+ICAJY29va2llID0gY29u
c29sZV9zcmN1X3JlYWRfbG9jaygpOwo+PiAgCj4+ICAJZmxhZ3MgPSBjb25zb2xlX3NyY3VfcmVh
ZF9mbGFncyhjb24pOwo+PiAtCWlmIChjb25zb2xlX2lzX3VzYWJsZShjb24sIGZsYWdzLCBmYWxz
ZSkpIHsKPj4gKwlpZiAoY29uc29sZV9pc191c2FibGUoY29uLCBmbGFncywgZmFsc2UsIGNvbnNv
bGVzX3N1c3BlbmRlZCkpIHsKPgo+IFRoZSBuZXcgZ2xvYmFsIGNvbnNvbGVfc3VzcGVuZGVkIHZh
bHVlIGhhcyB0aGUgYmUgc3luY2hyb25pemVkIHRoZQo+IHNhbWUgd2F5IGFzIHRoZSBjdXJyZW50
IENPTl9TVVNQRU5ERUQgcGVyLWNvbnNvbGUgZmxhZy4KPiBJdCBtZWFucyB0aGF0IHRoZSB2YWx1
ZSBtdXN0IGJlOgo+Cj4gICArIHVwZGF0ZWQgb25seSB1bmRlciBjb25zb2xlX2xpc3RfbG9jayB0
b2dldGhlciB3aXRoCj4gICAgIHN5bmNocm9uaXplX3JjdSgpLgo+Cj4gICArIHJlYWQgdXNpbmcg
UkVBRF9PTkNFKCkgdW5kZXIgY29uc29sZV9zcmN1X3JlYWRfbG9jaygpCgpZZXMuCgo+IEkgYW0g
Z29pbmcgdG8gcHJvcG9zZSBtb3JlIHNvbHV0aW9ucyBiZWNhdXNlIG5vIG9uZSBpcyBvYnZpb3Vz
bHkKPiB0aGUgYmVzdCBvbmUuCgpbLi4uXQoKPiBWYXJpYW50IEM6Cj4gPT09PT09PT09PQo+Cj4g
UmVtb3ZlIGV2ZW4gQGZsYWdzIHBhcmFtZXRlciBmcm9tIGNvbnNvbGVfaXNfdXNhYmxlKCkgYW5k
IHJlYWQgYm90aAo+IHZhbHVlcyB0aGVyZSBkaXJlY3RseS4KPgo+IE1hbnkgY2FsbGVycyByZWFk
IEBmbGFncyBvbmx5IGJlY2F1c2UgdGhleSBjYWxsIGNvbnNvbGVfaXNfdXNhYmxlKCkuCj4gVGhl
IGNoYW5nZSB3b3VsZCBzaW1wbGlmeSB0aGUgY29kZS4KPgo+IEJ1dCB0aGVyZSBhcmUgZmV3IGV4
Y2VwdGlvbnM6Cj4KPiAgIDEuIF9fbmJjb25fYXRvbWljX2ZsdXNoX3BlbmRpbmcoKSwgY29uc29s
ZV9mbHVzaF9hbGwoKSwKPiAgICAgIGFuZCBsZWdhY3lfa3RocmVhZF9zaG91bGRfd2FrZXVwKCkg
cGFzcyBAZmxhZ3MgdG8KPiAgICAgIGNvbnNvbGVfaXNfdXNhYmxlKCkgYW5kIGFsc28gY2hlY2sg
Q09OX05CQ09OIGZsYWcuCj4KPiAgICAgIEJ1dCBDT05fTkJDT04gZmxhZyBpcyBzcGVjaWFsLiBJ
dCBpcyBzdGF0aWNhbGx5IGluaXRpYWxpemVkCj4gICAgICBhbmQgbmV2ZXIgc2V0L2NsZWFyZWQg
YXQgcnVudGltZS4gSXQgY2FuIGJlIGNoZWNrZWQgd2l0aG91dAo+ICAgICAgUkVBRF9PTkNFKCku
IFdlbGwsIHdlIHN0aWxsIG1pZ2h0IHdhbnQgdG8gYmUgc3VyZSB0aGF0Cj4gICAgICB0aGUgc3Ry
dWN0IGNvbnNvbGUgY2FuJ3QgZGlzYXBwZWFyLgo+Cj4gICAgICBJTUhPLCB0aGlzIGNhbiBiZSBz
b2x2ZWQgYnkgYSBoZWxwZXIgZnVuY3Rpb246Cj4KPiAJLyoqCj4gCSAqIGNvbnNvbGVfc3JjdV9p
c19uYmNvbiAtIExvY2tsZXNzbHkgY2hlY2sgd2hldGhlciB0aGUgY29uc29sZSBpcyBuYmNvbgo+
IAkgKiBAY29uOglzdHJ1Y3QgY29uc29sZSBwb2ludGVyIG9mIGNvbnNvbGUgdG8gY2hlY2sKPiAJ
ICoKPiAJICogUmVxdWlyZXMgY29uc29sZV9zcmN1X3JlYWRfbG9jayB0byBiZSBoZWxkLCB3aGlj
aCBpbXBsaWVzIHRoYXQgQGNvbiBtaWdodAo+IAkgKiBiZSBhIHJlZ2lzdGVyZWQgY29uc29sZS4g
VGhlIHB1cnBvc2Ugb2YgaG9sZGluZyBjb25zb2xlX3NyY3VfcmVhZF9sb2NrIGlzCj4gCSAqIHRv
IGd1YXJhbnRlZSB0aGF0IG5vIGV4aXQvY2xlYW51cCByb3V0aW5lcyB3aWxsIHJ1biBpZiB0aGUg
Y29uc29sZQo+IAkgKiBpcyBjdXJyZW50bHkgdW5kZXJnb2luZyB1bnJlZ2lzdHJhdGlvbi4KPiAJ
ICoKPiAJICogSWYgdGhlIGNhbGxlciBpcyBob2xkaW5nIHRoZSBjb25zb2xlX2xpc3RfbG9jayBv
ciBpdCBpcyBfY2VydGFpbl8gdGhhdAo+IAkgKiBAY29uIGlzIG5vdCBhbmQgd2lsbCBub3QgYmVj
b21lIHJlZ2lzdGVyZWQsIHRoZSBjYWxsZXIgbWF5IHJlYWQKPiAJICogQGNvbi0+ZmxhZ3MgZGly
ZWN0bHkgaW5zdGVhZC4KPiAJICoKPiAJICogQ29udGV4dDogQW55IGNvbnRleHQuCj4gCSAqIFJl
dHVybjogVHJ1ZSB3aGVuIENPTl9OQkNPTiBmbGFnIGlzIHNldC4KPiAJICovCj4gCXN0YXRpYyBp
bmxpbmUgYm9vbCBjb25zb2xlX2lzX25iY29uKGNvbnN0IHN0cnVjdCBjb25zb2xlICpjb24pCj4g
CXsKPiAJCVdBUk5fT05fT05DRSghY29uc29sZV9zcmN1X3JlYWRfbG9ja19pc19oZWxkKCkpOwo+
Cj4gCQkvKgo+IAkJICogVGhlIENPTl9OQkNPTiBmbGFnIGlzIHN0YXRpY2FsbHkgaW5pdGlhbGl6
ZWQgYW5kIGlzIG5ldmVyCj4gCQkgKiBzZXQgb3IgY2xlYXJlZCBhdCBydW50aW1lLgo+IAkJcmV0
dXJuIGRhdGFfcmFjZShjb24tPmZsYWdzICYgQ09OX05CQ09OKTsKPiAJfQoKQWdyZWVkLgoKPiAg
ICAyLiBBbm90aGVyIGV4Y2VwdGlvbiBpcyBfX3ByX2ZsdXNoKCkgd2hlcmUgY29uc29sZV9pc191
c2FibGUoKSBpcwo+ICAgICAgIGNhbGxlZCB0d2ljZSB3aXRoIEB1c2VfYXRvbWljIHNldCAidHJ1
ZSIgYW5kICJmYWxzZSIuCj4KPiAgICAgICBXZSB3b3VsZCB3YW50IHRvIHJlYWQgImNvbi0+Zmxh
Z3MiIG9ubHkgb25jZSBoZXJlLiBBIHNvbHV0aW9uCj4gICAgICAgd291bGQgYmUgdG8gYWRkIGEg
cGFyYW1ldGVyIHRvIGNoZWNrIGJvdGggY29uLT53cml0ZV9hdG9taWMKPiAgICAgICBhbmQgY29u
LT53cml0ZV90aHJlYWQgaW4gYSBzaW5nbGUgY2FsbC4KCk9yIGl0IGNvdWxkIGJlY29tZSBhIGJp
dG1hc2sgb2YgcHJpbnRpbmcgdHlwZXMgdG8gY2hlY2s6CgojZGVmaW5lIEFUT01JQ19QUklOVElO
RyAweDEKI2RlZmluZSBOT05BVE9NSUNfUFJJTlRJTkcgMHgyCgphbmQgdGhlbiBfX3ByX2ZsdXNo
KCkgbG9va3MgbGlrZToKCmlmICghY29uc29sZV9pc191c2FibGUoYywgZmxhZ3MsIEFUT01JQ19Q
UklOVElOR3xOT05BVE9NSUNfUFJJTlRJTkcpCgo+ICAgICAgIEJ1dCBpdCBtaWdodCBhY3R1YWxs
eSBiZSBlbm91Z2ggdG8gY2hlY2sgaXMgd2l0aCB0aGUgImZhbHNlIgo+ICAgICAgIHZhbHVlIGJl
Y2F1c2UgImNvbi0+d3JpdGVfdGhyZWFkKCkiIGlzIG1hbmRhdG9yeSBmb3IgbmJjb24KPiAgICAg
ICBjb25zb2xlcy4gQW5kIGxlZ2FjeSBjb25zb2xlcyBkbyBub3QgZGlzdGluZ3Vpc2ggYXRvbWlj
IG1vZGUuCgpBIGJpdCB0cmlja3ksIGJ1dCB5b3UgYXJlIHJpZ2h0LgoKPgo+Cj4gVmFyaWFudCBE
Ogo+ID09PT09PT09PT0KPgo+IFdlIG5lZWQgdG8gZGlzdGluZ3Vpc2ggdGhlIGdsb2JhbCBhbmQg
cGVyLWNvbnNvbGUgInN1c3BlbmRlZCIgZmxhZwo+IGJlY2F1c2UgdGhleSBtaWdodCBiZSBuZXN0
ZWQuIEJ1dCB3ZSBjb3VsZCB1c2UgYSBzZXBhcmF0ZSBmbGFnCj4gZm9yIHRoZSBnbG9iYWwgc2V0
dGluZy4KPgo+IEkgbWVhbiB0aGF0Ogo+Cj4gICAgICsgY29uc29sZV9zdXNwZW5kKCkgd291bGQg
c2V0IENPTl9TVVNQRU5ERUQgZmxhZwo+ICAgICArIGNvbnNvbGVfc3VzcGVuZF9hbGwoKSB3b3Vs
ZCBzZXQgQ09OX1NVU1BFTkRFRF9BTEwgZmxhZwo+Cj4gVGhleSBib3RoIHdpbGwgYmUgaW4gY29u
LT5mbGFncy4KPgo+IFByb3M6Cj4KPiAgICAgKyBJdCBpcyBlYXN5IHRvIGltcGxlbWVudC4KPgo+
IENvbnM6Cj4KPiAgICAgKyBJdCBmZWVscyBhIGJpdCB1Z2x5Lgo+Cj4KPiBNeSBvcGluaW9uOgo+
ID09PT09PT09PT09Cj4KPiBJIHBlcnNvbmFsbHkgcHJlZmVyIHRoZSB2YXJpYW50IEMgYmVjYXVz
ZToKPgo+ICAgKyBSZW1vdmVzIG9uZSBwYXJhbWV0ZXIgZnJvbSBjb25zb2xlX2lzX3VzYWJsZSgp
Lgo+Cj4gICArIFRoZSBsb2NrbGVzcyBzeW5jaHJvbml6YXRpb24gb2YgYm90aCBnbG9iYWwgYW5k
IHBlci1jb25zb2xlCj4gICAgIGZsYWdzIGlzIGhpZGRlbiBpbiBjb25zb2xlX2lzX3VzYWJsZSgp
Lgo+Cj4gICArIFRoZSBnbG9iYWwgY29uc29sZV9zdXNwZW5kZWQgZmxhZyB3aWxsIGJlIHN0b3Jl
ZCBpbiBnbG9iYWwKPiAgICAgdmFyaWFibGUgKGluIGNvbXBhcmUgd2l0aCB2YXJpYW50IEQpLgo+
Cj4gV2hhdCBkbyB5b3UgdGhpbmssIHBsZWFzZT8KPgo+IEJlc3QgUmVnYXJkcywKPiBQZXRyCj4K
Pgo+IFBTOiBUaGUgY29tbWl0IG1lc3NhZ2UgYW5kIHRoZSBjb3ZlciBsZXR0ZXIgc2hvdWxkIGJl
dHRlciBleHBsYWluCj4gICAgIHRoZSBiYWNrZ3JvdW5kIG9mIHRoaXMgY2hhbmdlLgo+Cj4gICAg
IEl0IHdvdWxkIGJlIGdyZWF0IGlmIHRoZSBjb3ZlciBsZXR0ZXIgZGVzY3JpYmVkIHRoZSBiaWdn
ZXIKPiAgICAgcGljdHVyZSwgZXNwZWNpYWxseSB0aGUgaGlzdG9yeSBvZiB0aGUgY29uc29sZV9z
dXNwZW5kZWQsCj4gICAgIENPTl9TVVNQRU5ERUQsIGFuZCBDT05fRU5BQkxFRCBmbGFncy4gSXQg
bWlnaHQgdXNlIGluZm8KPiAgICAgZnJvbQo+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sL1p5b05aZkxUNnRsVkFXak9AcGF0aHdheS5zdXNlLmN6Lwo+ICAgICBhbmQgbWF5YmUgZXZl
biB0aGlzIGxpbmsuCj4KPiAgICAgQWxzbyB0aGlzIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBtZW50
aW9uIHRoYXQgaXQgcGFydGx5IHJldmVydHMKPiAgICAgdGhlIGNvbW1pdCA5ZTcwYTVlMTA5YTRh
MjMzNjc4ICgicHJpbnRrOiBBZGQgcGVyLWNvbnNvbGUKPiAgICAgc3VzcGVuZGVkIHN0YXRlIiku
IEJ1dCBpdCBpcyBub3Qgc2ltcGxlIHJldmVydCBiZWNhdXNlCj4gICAgIHdlIG5lZWQgdG8gcHJl
c2VydmUgdGhlIHN5bmNocm9uaXphdGlvbiB1c2luZwo+ICAgICB0aGUgY29uc29sZV9saXN0X2xv
Y2sgZm9yIHdyaXRpbmcgYW5kIFNSQ1UgZm9yIHJlYWRpbmcuCgotLSAKSm9obiBPZ25lc3MKTGlu
dXRyb25peCBHbWJIIHwgQmFobmhvZnN0cmHDn2UgMyB8IEQtODg2OTAgVWhsZGluZ2VuLU3DvGhs
aG9mZW4KUGhvbmU6ICs0OSA3NTU2IDI1IDk5OSAyMDsgRmF4LjogKzQ5IDc1NTYgMjUgOTk5IDk5
CgpIaW53ZWlzZSB6dW0gRGF0ZW5zY2h1dHogZmluZGVuIFNpZSBoaWVyIChJbmZvcm1hdGlvbiBv
biBkYXRhIHByaXZhY3kKY2FuIGJlIGZvdW5kIGhlcmUpOiBodHRwczovL2xpbnV0cm9uaXguZGUv
bGVnYWwvZGF0YS1wcm90ZWN0aW9uLnBocAoKTGludXRyb25peCBHbWJIIHwgRmlybWVuc2l0eiAo
UmVnaXN0ZXJlZCBPZmZpY2UpOiBVaGxkaW5nZW4tTcO8aGxob2ZlbiB8ClJlZ2lzdGVyZ2VyaWNo
dCAoUmVnaXN0cmF0aW9uIENvdXJ0KTogQW10c2dlcmljaHQgRnJlaWJ1cmcgaS5Cci4sIEhSQjcw
MAo4MDYgfCBHZXNjaMOkZnRzZsO8aHJlciAoTWFuYWdpbmcgRGlyZWN0b3JzKTogSGFycnkgRGVt
YXMsIEhlaW56IEVnZ2VyLApUaG9tYXMgR2xlaXhuZXIsIFlpbiBTb3JyZWxsLCBKZWZmcmV5IFNj
aG5laWRlcm1hbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
a2dkYi1idWdyZXBvcnQK
