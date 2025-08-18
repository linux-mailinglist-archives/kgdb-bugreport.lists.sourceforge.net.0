Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFAEB2B38E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 18 Aug 2025 23:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmEsnevLFgkEhe7Rramm+V2NQXzXFV5ywVHzm0UkkLs=; b=ElcdqhDFDdWzft4NyqTkZWP4y0
	rYUsEtjNB1mOmkJM199YGB3UfK21jiubdoPD1vSm8/5kv1ytNiWnTP5yo8ldmCYZP9jD5zaWN8NqH
	q5voXIEkX+INac/R3o6JYQY36vj8GZ4pnsEexIch12bPvFec7Xll0GO/gqpcgKO6Pczk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uo7bo-0008WP-4F
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 18 Aug 2025 21:41:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uo7bm-0008W6-FH
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 18 Aug 2025 21:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RrUPoAix4GJmNCXAtshi2uvFt0DKJJ/xCnFV+qY1rgk=; b=DwI9MDALfOMFwsgZTWYjAejMC0
 XZ9J0g2XeJ6sUrVjkRiSB+MzIOsZiGZwmw8532HCTA2kYz1Uw3XAjXFeiQHNwDRTS7vyRFFyo4cbN
 JzuCIkdM5yJSkweoHNuEmlOAsbPwY4q6PW5ZQcngU6KhkP2QfRTY3r7kzaTOi8kGbYww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RrUPoAix4GJmNCXAtshi2uvFt0DKJJ/xCnFV+qY1rgk=; b=UbkQl5psPuIw26ZQBKbSSpk0RK
 EWvO49EVKmu0J36FFLhhSaGu1hKpR5hEWmPrUizmv3Vp8JeM5lK4tfsP74uVDp8G+xuHQ9ZYUckeu
 LUqZH9Qa0JoJucEXg8tjHenmJ8wZhxUmMS5w8A3edse7f4sWCiR3UfoUFbzfjlY9ETHE=;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uo7bm-0002Z1-O6 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 18 Aug 2025 21:41:39 +0000
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso747165066b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 18 Aug 2025 14:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755553287; x=1756158087;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RrUPoAix4GJmNCXAtshi2uvFt0DKJJ/xCnFV+qY1rgk=;
 b=G6o+KZy99P17LtP+ABpHjIQYA3eOgYwpCt2I1dEUa1TTLglyH09S6mPFS+L/BsbeYV
 rRJFIeLJ3UQxJIKQDzRIZfZj7Rp6jmPjEFqBxrcohRAQLn0LFOHWnDdH/WO7Jdd5ZhBw
 rEpGN+4nEDRTza4flRrIyEj5H7Foi62tdhCh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755553287; x=1756158087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RrUPoAix4GJmNCXAtshi2uvFt0DKJJ/xCnFV+qY1rgk=;
 b=w/gTdizF33ckoYJgd7M7gahKaZqfr29Aj1uJT9ZoZzzFeXY2LpAU8u6BBgD41I4eMM
 9eUxf29GhDNEwvgkUatUPzlg4Z8W5M+RUxA8AdhYiw/ubVu9561YGMlETR5Mdq3/ujHo
 hHzo/NUbf9yUP0m1DvRZpQ146l0CwyZm/nlPBzsSzLbRDOfHWUfzPrQkWkacIWIVnxhH
 nyeTcT+Qn9oRBjY8kryx/W3LuRTc/9zWUaYUmQTiCcKvwLLGN/VNEBrQyLa99M525xc6
 ZCS6YR9mCOdIz+ET9BaEu+gZVeUyBX/hH9FJf/rAVFLzqg2paQKngu4QeEp7BB1dMuAG
 dW2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX4f//UzHB0ugXNKvkNkIhmFPSdh3sa6pvgUqe1MkO9XFTIMwLA/J9B0rTSMFeQYd59vN1LlkOnWFC1yG1tA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyMtiaojF0uxxtbEeX+Agog5xE09S7p4fdlNOq1Nj/4LVB25Hvz
 48mJguUVA8GpNivSa2/2kyNmVgqsgg7XEuDIghCMeB8mctcBKlwq1unrmlh1TS8nZL9pG9GivRi
 RJgbnlzPl
X-Gm-Gg: ASbGncv73ty37Aszgc80sEuiaIF2vzJXGP71t7UZi8f+POKRE+xgWXx1KxfKb2T68e1
 2W131I6ymPsW3U4G5GyiTo+9JTEESPpZb2Xu7PlLeQj9m1FeZDPtKdXchd85k4jVUugj+hI0fKM
 dq8J9yMcbpMu36RGmq2MoUHOziO1WpJxtQHOM/T2tiRs/231XCXabfmePf8uKtXUUxDTSjcZjQU
 2R9TMuwrHCDrzP20GwMbDtdJOx6DtENmJCXO2tfO+EJLEzHDaQxv2KRjoaOcO/Yt/F3fGH2X3mM
 ze3o1zuncGhBu4bmdHa/8GBs1rTW6fcg52+IXPWQKFYpNTPrKeeb2ycZBEpU7Zio1FAgbsO01Ue
 1FB4v/HuAw91wPASViewpR0MFbjH4Ke8pTm0+nLcdfz87ml0c26TK+J9tIQR3+Q==
X-Google-Smtp-Source: AGHT+IHOlrwLpqne7u4NBRymQYfOkwgqQXrGRK5vzEYhcyXFFu8EczoA9oXHAsm3f2wIWbOV4mLwow==
X-Received: by 2002:a05:6402:3491:b0:618:40f0:89b7 with SMTP id
 4fb4d7f45d1cf-61a798f6ce9mr266483a12.34.1755549322916; 
 Mon, 18 Aug 2025 13:35:22 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a75794ba2sm400424a12.45.2025.08.18.13.35.21
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 13:35:22 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso739606166b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 18 Aug 2025 13:35:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIXnP80s+jEnyt5YcHRGzkfarbT2+DWqMchbn4y9K9nCbbZ62QvUmNlccC/LC1hmBOrQQ5c/OoWihgEfL3nA==@lists.sourceforge.net
X-Received: by 2002:a17:907:94c8:b0:afd:d9e4:51e7 with SMTP id
 a640c23a62f3a-afddd24e88emr11714066b.63.1755549321531; Mon, 18 Aug 2025
 13:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250818181153.661431-1-thorsten.blum@linux.dev>
 <20250818181153.661431-3-thorsten.blum@linux.dev>
In-Reply-To: <20250818181153.661431-3-thorsten.blum@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 13:35:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7Qhz4dNnhb3t4+Bz3Fk5iKxRNwrq8u4X73tpGsg=hyA@mail.gmail.com>
X-Gm-Features: Ac12FXzfHvX5IPb4DpSB34IuOPv7zZbGkqkbrqt_GWvH8ZKvsXy6Qt9lVJvk3rU
Message-ID: <CAD=FV=W7Qhz4dNnhb3t4+Bz3Fk5iKxRNwrq8u4X73tpGsg=hyA@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Aug 18,
 2025 at 11:14 AM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > strcpy() is deprecated; use memcpy() instead. > > We can safely
 use memcpy() because we already know the length of t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.50 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uo7bm-0002Z1-O6
Subject: Re: [Kgdb-bugreport] [PATCH 3/4] kdb: Replace deprecated strcpy()
 with memcpy() in parse_grep()
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
Cc: Nir Lichtman <nir@lichtman.org>, Jason Wessel <jason.wessel@windriver.com>,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>,
 Daniel Thompson <danielt@kernel.org>, linux-hardening@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEF1ZyAxOCwgMjAyNSBhdCAxMToxNOKAr0FNIFRob3JzdGVuIEJsdW0gPHRo
b3JzdGVuLmJsdW1AbGludXguZGV2PiB3cm90ZToKPgo+IHN0cmNweSgpIGlzIGRlcHJlY2F0ZWQ7
IHVzZSBtZW1jcHkoKSBpbnN0ZWFkLgo+Cj4gV2UgY2FuIHNhZmVseSB1c2UgbWVtY3B5KCkgYmVj
YXVzZSB3ZSBhbHJlYWR5IGtub3cgdGhlIGxlbmd0aCBvZiB0aGUKPiBzb3VyY2Ugc3RyaW5nICdj
cCcgYW5kIHRoYXQgaXQgaXMgZ3VhcmFudGVlZCB0byBiZSBOVUwtdGVybWluYXRlZCB3aXRoaW4K
PiB0aGUgZmlyc3QgS0RCX0dSRVBfU1RSTEVOIGJ5dGVzLgo+Cj4gTGluazogaHR0cHM6Ly9naXRo
dWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzg4Cj4gU2lnbmVkLW9mZi1ieTogVGhvcnN0ZW4gQmx1
bSA8dGhvcnN0ZW4uYmx1bUBsaW51eC5kZXY+Cj4gLS0tCj4gIGtlcm5lbC9kZWJ1Zy9rZGIva2Ri
X21haW4uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jIGIva2Vy
bmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gaW5kZXggN2E0ZDJkNDY4OWE1Li5jZGY5MTk3NmVi
N2MgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gKysrIGIva2Vy
bmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gQEAgLTg2MCw3ICs4NjAsNyBAQCBzdGF0aWMgdm9p
ZCBwYXJzZV9ncmVwKGNvbnN0IGNoYXIgKnN0cikKPiAgICAgICAgICAgICAgICAga2RiX3ByaW50
Zigic2VhcmNoIHN0cmluZyB0b28gbG9uZ1xuIik7Cj4gICAgICAgICAgICAgICAgIHJldHVybjsK
PiAgICAgICAgIH0KPiAtICAgICAgIHN0cmNweShrZGJfZ3JlcF9zdHJpbmcsIGNwKTsKPiArICAg
ICAgIG1lbWNweShrZGJfZ3JlcF9zdHJpbmcsIGNwLCBsZW4gKyAxKTsKCkknbSBPSyB3aXRoIHRo
aXM6CgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3Jn
PgoKQSBwYXJ0IG9mIG1lIHdvdWxkIHJhdGhlciB1c2Ugc3Ryc2NweSgpIHRoZSB3YXkgaXQncyBz
dXBwb3NlZCB0byBiZQp1c2VkIHRvIHNpbXBsaWZ5IHRoZSBjb2RlIGEgdGlueSBiaXQuLi4gQUtB
ICh1bnRlc3RlZCk6CgotICAgICAgIGxlbiA9IHN0cmxlbihjcCk7CisgICAgICAgbGVuID0gc3Ry
c2NweShrZGJfZ3JlcF9zdHJpbmcsIGNwKTsKICAgICAgICBpZiAoIWxlbikKICAgICAgICAgICAg
ICAgIHJldHVybjsKLSAgICAgICBpZiAobGVuID49IEtEQl9HUkVQX1NUUkxFTikgeworICAgICAg
IGlmIChsZW4gPCAwKSB7CiAgICAgICAgICAgICAgICBrZGJfcHJpbnRmKCJzZWFyY2ggc3RyaW5n
IHRvbyBsb25nXG4iKTsKICAgICAgICAgICAgICAgIHJldHVybjsKICAgICAgICB9Ci0gICAgICAg
c3RyY3B5KGtkYl9ncmVwX3N0cmluZywgY3ApOwoKSSBndWVzcyB0aGlzIGRvZXMgImNoYW5nZSIg
dGhlIGJlaGF2aW9yIGluIHRoYXQgYGtkYl9ncmVwX3N0cmluZ2Agd2lsbApzdGlsbCBiZSBzZXQg
dG8gdGhlIGVtcHR5IHN0cmluZyBpbiB0aGUgY2FzZSB0aGF0ICJsZW4iIHdhcyAwIGFuZCB3aWxs
CnN0aWxsIGJlIHNldCB0byBhIHRydW5jYXRlZCBjb3B5IGluIHRoZSBjYXNlIHRoYXQgImxlbiIg
d2FzIHRvbyBiaWcsCmJ1dCBiYXNlZCBvbiBteSBxdWljayBhbmFseXNpcyBvZiB0aGUgY29kZSB0
aGF0IHNob3VsZCBiZSBmaW5lLgoKSW4gYW55IGNhc2UsIHdlJ3JlIGdldHRpbmcgcHJldHR5IGZh
ciBpbnRvIG5pdHBpY2tzIGhlcmUsIHNvIEknbSBhbHNvCk9LIHcvIGp1c3QgbGVhdmluZyBpdCB0
aGUgd2F5IHlvdSBoYXZlIGl0LiA7LSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBv
cnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
