Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C508A6C69CD
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 23 Mar 2023 14:45:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pfLFz-0006Gg-J2
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 23 Mar 2023 13:45:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <piotrgorski@cachyos.org>) id 1peXKK-0002fh-Gi
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Mar 2023 08:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:From:References:Cc:To:Subject:
 MIME-Version:Date:Message-ID:Content-Type:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gnBGzRaYB060i7UVHndJWNSJn2ccH1FnQj+ZULCB/TM=; b=cRl9XmjXpC2J4iMUQZnWLjQYme
 LBpb2t7389LcgzMp11kTyuVSsIL2on09HphivhTr7MJkhEEp9Cm9GIkXSwYBuY63EVYH5uQ/ul6UE
 oMW54voMC2zoJ1YJZ7SjfUF1hJ79U1wlPjgRKj+LluUJA8hkvSzdagz0YcY48FCWqVxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gnBGzRaYB060i7UVHndJWNSJn2ccH1FnQj+ZULCB/TM=; b=EIPhn20q/kaW0Ijk0RSCLRQ6da
 Z2ewvoKB6TMcBfuAijk7SVonT3XZcTxfzKPLQAyRdg5FVUhKPlgoydgGdyr8MeJAzpdA4+L+QoMk7
 69swGarzY0U3HW26x4iRDw6Q5aU9CZyOy4NlVgOF7oIfL0qBCGzJXuWtLLVbhqnT3w+g=;
Received: from mail.ptr1337.dev ([202.61.224.105])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1peXKK-0005yy-Lx for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Mar 2023 08:26:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 631F7280212; Tue, 21 Mar 2023 09:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
 t=1679386237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-language:in-reply-to:references;
 bh=gnBGzRaYB060i7UVHndJWNSJn2ccH1FnQj+ZULCB/TM=;
 b=cytJz3XujFIDmQOi3Eq4w83+g57BUUX/Ksw0Hw/XKZhtMnxbN6p8h9gCIQNuP5rarUqo8G
 UmLMSEdPrsLFtzBs8rJ2ti3SqIaNADtNF63Gs7rtD68zcxoghTRI5qMN2iWGcHdep6dh5h
 B+H1XnXYMl2bzIoxXeAythAMRQfU33VPripeH+2uvfzSR55H0hTfsH5mmujaSqjqNRmi70
 d8XM2j6OlY5cXPT/2qZ5NhLgmjsuKMXIPw9iU8x8t5jA2HvN4vAKT9+F7+dQMo3q+onDm1
 AXjmC/bQ0debJYJCqBwJbn/6qsBBvKgkhHFhHWrSb/nGmZF+QL5ZKOhxwV8upg==
Message-ID: <245c9808-2167-592e-51d0-45890c51cd23@cachyos.org>
Date: Tue, 21 Mar 2023 09:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Chris Down <chris@chrisdown.name>,
 Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, live-patching@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev
References: <20230315125256.22772-1-fmdefrancesco@gmail.com>
Content-Language: pl-PL, en-US
In-Reply-To: <20230315125256.22772-1-fmdefrancesco@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Piotr Gorski<piotrgorski@cachyos.org> W dniu
   15.03.2023 o 13:52, Fabio M. De Francesco pisze: > Use kunmap_local() to
   unmap pages locally mapped with kmap_local_page(). > > kunmap_local() must
    be called on the kernel virtual address retu [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1peXKK-0005yy-Lx
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:45:23 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH] module/decompress: Never use kunmap()
 for local un-mappings
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
From: Piotr Gorski via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Piotr Gorski <piotrgorski@cachyos.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Stephen Boyd <swboyd@chromium.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IFBpb3RyIEdvcnNraTxwaW90cmdvcnNraUBjYWNoeW9zLm9yZz4KClcgZG5p
dSAxNS4wMy4yMDIzIG/CoDEzOjUyLCBGYWJpbyBNLiBEZSBGcmFuY2VzY28gcGlzemU6Cj4gVXNl
IGt1bm1hcF9sb2NhbCgpIHRvIHVubWFwIHBhZ2VzIGxvY2FsbHkgbWFwcGVkIHdpdGgga21hcF9s
b2NhbF9wYWdlKCkuCj4KPiBrdW5tYXBfbG9jYWwoKSBtdXN0IGJlIGNhbGxlZCBvbiB0aGUga2Vy
bmVsIHZpcnR1YWwgYWRkcmVzcyByZXR1cm5lZCBieQo+IGttYXBfbG9jYWxfcGFnZSgpLCBkaWZm
ZXJlbnRseSBmcm9tIGhvdyB3ZSB1c2Uga3VubWFwKCkgd2hpY2ggaW5zdGVhZAo+IGV4cGVjdHMg
dGhlIG1hcHBlZCBwYWdlIGFzIGl0cyBhcmd1bWVudC4KPgo+IEluIG1vZHVsZV96c3RkX2RlY29t
cHJlc3MoKSB3ZSBjdXJyZW50bHkgbWFwIHdpdGgga21hcF9sb2NhbF9wYWdlKCkgYW5kCj4gdW5t
YXAgd2l0aCBrdW5tYXAoKS4gVGhpcyBicmVha3MgdGhlIGNvZGUgYW5kIHNvIGl0IHNob3VsZCBi
ZSBmaXhlZC4KPgo+IENjOiBQaW90ciBHb3Jza2k8cGlvdHJnb3Jza2lAY2FjaHlvcy5vcmc+Cj4g
Q2M6IERtaXRyeSBUb3Jva2hvdjxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPgo+IENjOiBMdWlz
IENoYW1iZXJsYWluPG1jZ3JvZkBrZXJuZWwub3JnPgo+IENjOiBTdGVwaGVuIEJveWQ8c3dib3lk
QGNocm9taXVtLm9yZz4KPiBDYzogSXJhIFdlaW55PGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gRml4
ZXM6IDE2OWE1OGFkODI0ZCAoIm1vZHVsZS9kZWNvbXByZXNzOiBTdXBwb3J0IHpzdGQgaW4ta2Vy
bmVsIGRlY29tcHJlc3Npb24iKQo+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIE0uIERlIEZyYW5jZXNj
bzxmbWRlZnJhbmNlc2NvQGdtYWlsLmNvbT4KPiAtLS0KPiAgIGtlcm5lbC9tb2R1bGUvZGVjb21w
cmVzcy5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL21vZHVsZS9kZWNvbXByZXNzLmMgYi9rZXJu
ZWwvbW9kdWxlL2RlY29tcHJlc3MuYwo+IGluZGV4IGJiNzlhYzFhNmQ4Zi4uN2RkYzg3YmVlMjc0
IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9tb2R1bGUvZGVjb21wcmVzcy5jCj4gKysrIGIva2VybmVs
L21vZHVsZS9kZWNvbXByZXNzLmMKPiBAQCAtMjY3LDcgKzI2Nyw3IEBAIHN0YXRpYyBzc2l6ZV90
IG1vZHVsZV96c3RkX2RlY29tcHJlc3Moc3RydWN0IGxvYWRfaW5mbyAqaW5mbywKPiAgIAkJenN0
ZF9kZWMuc2l6ZSA9IFBBR0VfU0laRTsKPiAgIAo+ICAgCQlyZXQgPSB6c3RkX2RlY29tcHJlc3Nf
c3RyZWFtKGRzdHJlYW0sICZ6c3RkX2RlYywgJnpzdGRfYnVmKTsKPiAtCQlrdW5tYXAocGFnZSk7
Cj4gKwkJa3VubWFwX2xvY2FsKHpzdGRfZGVjLmRzdCk7Cj4gICAJCXJldHZhbCA9IHpzdGRfZ2V0
X2Vycm9yX2NvZGUocmV0KTsKPiAgIAkJaWYgKHJldHZhbCkKPiAgIAkJCWJyZWFrOwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBt
YWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
