Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D8A0C439
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 Jan 2025 22:54:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tXSO4-0002Ag-NI
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 13 Jan 2025 21:54:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tXSO3-0002AZ-1l
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Jan 2025 21:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WlhGBN9woQSdGnzV8x96ogtBqQuC9g0JDu8YvjYCsss=; b=Vnu7SRHEh9Gu15v2C49Xw/twlG
 6zWwFfj+7hN1XV7++J97NRATk1Qhu/ACAQo5rzFOfwmU7yEQLeEdVJaP/YkOqA/OrfzHS8H93hX+0
 Dw4sauArI9Gk33kuesiLg8/kUu3XBiKc6GK1VOPIyNpUNfVjQs6lf0Hs0Gva9WnjmT0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WlhGBN9woQSdGnzV8x96ogtBqQuC9g0JDu8YvjYCsss=; b=YpOudQRD89ieLhkZbjceXc2SM2
 Y4yY1BLfSQYTnXgYnLTIhyZzEm4UvyS4pXttlOP3ugKLIxGoVRA7xAJ9+Z83YtqXdfMqbTvH6jW1F
 aGl6kxLfCR//iqH6dc5MVARnb6F5H/XfXCtAfPO5Gx7zvgLyUV5t6HZflBnHkeeMz2E8=;
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tXSO1-0007FL-Mw for kgdb-bugreport@lists.sourceforge.net;
 Mon, 13 Jan 2025 21:54:18 +0000
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d647d5df90so8022475a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 Jan 2025 13:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736805249; x=1737410049;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlhGBN9woQSdGnzV8x96ogtBqQuC9g0JDu8YvjYCsss=;
 b=ircg0MGpYn6KuzZYq0giHNb8RQfCioeo4BnjllHad24NQkvwAvq4km5m/XdEEYiYQ3
 k8FMrWCunjrNHbP+RmO69LqEX2yd1zViGbyvnQQCxqK0CHXCxBu53qHBbxFdBMhZ18hZ
 yQ1sf5vsN6DFF7zN/o7IQcXTxfgqWDsxgeFqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736805249; x=1737410049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlhGBN9woQSdGnzV8x96ogtBqQuC9g0JDu8YvjYCsss=;
 b=cBWcYctaFviBbjpY7hGGULPhTQblcZWaT83vbMcW+AnQ5VqyMVb4Vt89rTphx4DWLZ
 htW3mm94lc3LThyVf8o41xcsKUTZIwyiMSiN6k5fgdxq0Ty367fxUnO8ZdmbkmtNEEma
 GFxd1hlvXPr40c7WRvx7i7qWm1At4H1XMw16xAryzrdRW9jLBvSg3EXZ/XrTBMARYk44
 FW3AnQJTZwFivUUt+BEVcZtOlcIRBNa8wzHzX2MLPI+6w0YwqEo1aRG2zjnCaZRcOm1/
 MuPdd4cHDgkwrtPcMoO6jujA4FpwUhuwnFi4qFuKiEqFdgabkIdDRaJ+sD+a5eZ2zLEd
 k6oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpGzNpipXKkU+sRpgqUBl2bkXC9QUP++fdaOwDdlQoyNfJxj4cdC/oeIFd6diJWtyUrNw8ODlnnap2Q/VuSA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwewaqwFDfzRKkAGIRj9AKSKzMIlAo9ETSIV00dCC3eqjqEO6UW
 dXA7AgShH0qPGqjgLHcnFy3TKwhnKPGpPqwEiQl6h53cNX5D3nn5z05SGtEpqlk3dS60r7gLInb
 9ipzx
X-Gm-Gg: ASbGnct4JLgqUrM7n+gvpjcoQXHtvn6eDCsXjlCAguxyBdQTy/xWkGpfFVW9DnwY7G6
 pmUeqZ3rTZG1Q8+ZF1++OQiKqiJdEhtS2j0nP841gEWao7TmQrfgticZfv0cQKhrBBLSq49/t/n
 HcGdoDkYYtXuvfe3VpYG9GT+p7Lw906oxgA0PhpZWxipNhwkAexLKXBnwMAfgl9RgE9U6L13H/v
 k1g+BmGf8lEPEHXZ37X9EGCV92KdozlD6jov0KOekQFLhTzQRHAvecs3pwTUhusMzoJYPSMqu/P
 FZ/AGzcSp6vEaCaeHJqN
X-Google-Smtp-Source: AGHT+IEk28HtW82ZurDJbQSjPtfFL4HgaM9D1qT5DWnjdrdJHr0YL7oilzqP3oluaN3fYBuqJEk57g==
X-Received: by 2002:a17:907:1c0c:b0:ab2:ffcb:edb4 with SMTP id
 a640c23a62f3a-ab2ffcbf448mr781126366b.25.1736805249557; 
 Mon, 13 Jan 2025 13:54:09 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9562ea8sm553562666b.93.2025.01.13.13.54.08
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 13:54:08 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38634c35129so3341885f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 Jan 2025 13:54:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNJXrCFhdFt1ZFUmkZ47JxtIHLeOrJJbL2kQbGdmy2O+Jlf1AxFrWr0noKvIP4WivNbAOPI6pAeg45RybG1w==@lists.sourceforge.net
X-Received: by 2002:a05:6000:1447:b0:386:1cf9:b96e with SMTP id
 ffacd0b85a97d-38a8733d452mr12466935f8f.55.1736805247997; Mon, 13 Jan 2025
 13:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20250112135759.105541-1-linux@treblig.org>
In-Reply-To: <20250112135759.105541-1-linux@treblig.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jan 2025 13:53:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VH5YWfTggGNt2KLoSPKqVTmWArEgccok3uFQ5BCA7cNw@mail.gmail.com>
X-Gm-Features: AbW1kva2TviXMYhxyHpnGtNBY4aB7CXv_b9DnL121HpWNrJodi84o5E5d9nFw0s
Message-ID: <CAD=FV=VH5YWfTggGNt2KLoSPKqVTmWArEgccok3uFQ5BCA7cNw@mail.gmail.com>
To: linux@treblig.org
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sun, Jan 12, 2025 at 5:58 AM <linux@treblig.org>
   wrote: > > From: "Dr. David Alan Gilbert" <linux@treblig.org> > > kgdb_nmi_poll_knock()
    has been unused since it was added in 2013 in > commit 0c5 [...] 
 
 Content analysis details:   (-2.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.208.47 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.208.47 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.47 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXSO1-0007FL-Mw
Subject: Re: [Kgdb-bugreport] [PATCH] serial: kgdb_nmi: Remove unused knock
 code
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, danielt@kernel.org, linux-serial@vger.kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIEphbiAxMiwgMjAyNSBhdCA1OjU44oCvQU0gPGxpbnV4QHRyZWJsaWcub3Jn
PiB3cm90ZToKPgo+IEZyb206ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8bGludXhAdHJlYmxp
Zy5vcmc+Cj4KPiBrZ2RiX25taV9wb2xsX2tub2NrKCkgaGFzIGJlZW4gdW51c2VkIHNpbmNlIGl0
IHdhcyBhZGRlZCBpbiAyMDEzIGluCj4gY29tbWl0IDBjNTdkZmNjNmMxZCAoInR0eS9zZXJpYWw6
IEFkZCBrZ2RiX25taSBkcml2ZXIiKQo+Cj4gUmVtb3ZlIGl0LCB0aGUgc3RhdGljIGhlbHBlcnMs
IGFuZCBtb2R1bGUgcGFyYW1ldGVycyBpdCB1c2VkLgo+Cj4gKFRoZSBjb21tZW50IGV4cGxhaW5p
bmcgd2h5IGl0IG1pZ2h0IGJlIHVzZWQgc291bmRzIHNlbnNpYmxlLCBidXQKPiBpdCdzIG5ldmVy
IGJlZW4gd2lyZWQgdXAsIHBlcmhhcHMgaXQncyB3b3J0aCBkb2luZyBzb21ld2hlcmU/KQo+Cj4g
U2lnbmVkLW9mZi1ieTogRHIuIERhdmlkIEFsYW4gR2lsYmVydCA8bGludXhAdHJlYmxpZy5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvdHR5L3NlcmlhbC9rZ2RiX25taS5jIHwgMTAxIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9rZ2RiLmggICAgICAgICAg
fCAgIDIgLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwMyBkZWxldGlvbnMoLSkKCkkgZ3Vlc3MgdGhp
cyBmdW5jdGlvbmFsaXR5IHdhcyBzdXBwb3NlZCB0byBiZSBhZGRlZCBpbiBhIGxhdGVyIHBhdGNo
CmluIHRoZSBzZXJpZXM/IEkgc2VlIGEgdXNlIG9mIHRoZSBjYWxsIGhlcmU6CgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzEzNDg1MjIwODAtMzI2MjktOS1naXQtc2VuZC1lbWFpbC1hbnRv
bi52b3JvbnRzb3ZAbGluYXJvLm9yZy8KCi4uLmJ1dCB0aGF0IG5ldmVyIGxhbmRlZC4uLgoKSXMg
dGhlIGFuc3dlciBoZXJlIHRoYXQgd2Ugc2hvdWxkIGp1c3QgZnVsbHkgcmV2ZXJ0IGNvbW1pdAow
YzU3ZGZjYzZjMWQgKCJ0dHkvc2VyaWFsOiBBZGQga2dkYl9ubWkgZHJpdmVyIik/IEZyb20gYSBx
dWljayBnbGFuY2UKSSBhbHNvIGRvbid0IHNlZSBhbnkgYXJjaGl0ZWN0dXJlcyB0aGF0IGltcGxl
bWVudApgYXJjaF9rZ2RiX29wcy5lbmFibGVfbm1pYD8gSSBndWVzcyB5b3UnZCBhbHNvIHdhbnQg
dG8gcmV2ZXJ0IHRoZXNlCnR3byBtYXliZT8KCmFkMzk0ZjY2ZmE1NyBrZGI6IEltcGxlbWVudCBk
aXNhYmxlX25taSBjb21tYW5kCjVhMTRmZWFkMDdiYyBrZXJuZWwvZGVidWc6IE1hc2sgS0dEQiBO
TUkgdXBvbiBlbnRyeQoKSSBkb24ndCBrbm93IGFsbCBvZiB0aGUgaGlzdG9yeSBoZXJlLiBNYXli
ZSBEYW5pZWwgb3IgU3VtaXQgZG8/CgoKSW4gZ2VuZXJhbCBJJ3ZlIHNvcnRhIGdpdmVuIHVwIG9u
IHRoZSBpZGVhIG9mIHRyeWluZyB0byBydW4gYSBzZXJpYWwKZHJpdmVyIGF0IE5NSSBwcmlvcml0
eS4gSSBrbm93IFN1bWl0IGhhZCBzb21lIHBhdGNoZXMgZm9yIHRoYXQgd2hlcmUKaGUgd2FudGVk
IHRvIGludGVycHJldCBzeXNycS1nIGF0IE5NSSB0aW1lLCBidXQgaXQgYWx3YXlzIGZlbHQgYQps
aXR0bGUgZnJhZ2lsZSAoYW5kIEkgZ3Vlc3MgbmV2ZXIgbGFuZGVkKS4gSU1PLCBoYXZpbmcgdGhl
IHNlcmlhbCBwb3J0CmJlIGF0IG5vcm1hbCBwcmlvcml0eSBsZXZlbCBpcyBuZWFybHkgYWx3YXlz
IGVub3VnaCB3aGVuIGNvbWJpbmVkIHdpdGgKYSB3YXRjaGRvZyB0aGF0IGNhbiB1c2UgTk1JcyB0
byBicmVhayBpbnRvIGEgbG9ja2VkLXVwIENQVS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1i
dWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
