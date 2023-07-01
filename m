Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82F74606A
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  3 Jul 2023 18:08:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qGM6Z-0000nt-Ra
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 03 Jul 2023 16:08:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qFdMc-0001cS-DW
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 01 Jul 2023 16:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eqUKdurwe6L/lCzL+nDfeInRljPuUHPLpXkXa64hvDk=; b=EUfzzIJqbNom3ubJUI3glhVCmR
 dNf4EsjDGA8Ke5ton92PLUxu2VBJl8CioY8Qo+uJtSpFOJ1TlDRj8Z4/a9yv8uMl56h62vwQ5lLLd
 giBLJ+dsOU02jwxpt7pOOEyn6UMUFJdoKwG+9CZt82ePmolRLyfBjxdEzpBkef5QvEf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eqUKdurwe6L/lCzL+nDfeInRljPuUHPLpXkXa64hvDk=; b=fgEFJKf0/5xjqRGpZQqqIzhrpY
 mTbQOTa+2pbka5kSZKFxcpBQdXtFA498MV4/JtVZZlsLq7tyK0DSi9m1Po2dCp5qeBiuPkeoGuOm9
 7iSgfY9526EHMJ666P531YNinovoKDyxCu4g9VQWPttARPGmqSNchh498IUfwD9uyC/8=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qFdMZ-003Ata-5E for kgdb-bugreport@lists.sourceforge.net;
 Sat, 01 Jul 2023 16:22:22 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1b852785a65so18746495ad.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 01 Jul 2023 09:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688228533; x=1690820533;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eqUKdurwe6L/lCzL+nDfeInRljPuUHPLpXkXa64hvDk=;
 b=Yu6rB9zpV2iWzMFz2uX0HZdqH0Pl2/8o54zaJG2YsxZhs0H9E46zOk+5RFz+CH+HFe
 C5lxxVmoyRIBmr9MYH4tMYF0dUGnz3hYvwGcfAXQbQfvZZkizPlP5CTNgP6vx7bUNhAu
 PHOlQ/XacJPR9M62K8dxJILm0sRcumDIGr2J3yFcTk0pNvEhNpzuH3v5UoaAb9e/cHyW
 XNcDCBAsGf0UcyVJoiPXroP8uI5BqeXpR4pWaF8OT/1kvLn5P9ocww2hBvauT+NixnPq
 72vrW5plPqkejIVKgJfBm3RtbKTAl9ySfLfdLWBNK13aXiM/a1nQlCOfN570m96SKPIJ
 W4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688228533; x=1690820533;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eqUKdurwe6L/lCzL+nDfeInRljPuUHPLpXkXa64hvDk=;
 b=SUlPEjR6tr9zq37Uf95LcgpMG4ueaCPmzjyR9f6irXTuEma8XO6GsqSMS5MVR1UZXw
 v+owvl/IaUkKGcEcIAh1n4E+m/g8y2bRotRCDIY7TrI6vwpV6G94MXskBEOc6oWSsaZT
 A1bohNnBTxifj5rfRqRAz4n5Ss2kMcHwK4/W5yCh/3ZEmXOoUZVQmGgwSEBd1waKP0F7
 pgW3yqGl7AjVPKG8NkVCIwuwyHylxr/JjibdL400fCHDNnCtEXY9N9WoXxas0Hwo77BI
 w5HMo5KqI2HOsxQXH0iZ09T6W8PeGv0dn+BACBmi83ps7RMNmhzSdne1xly9Q5DaVy5p
 WVcw==
X-Gm-Message-State: ABy/qLZJ7aQDOtUqt4CWDJpfjiiCMaccTK7mb8z3JwuBsYKZmMyTRalF
 zbECuBZWJWYmuHlCrpyBzqjTLIyjh70=
X-Google-Smtp-Source: APBJJlF4DRTk5B+Ly7B1ketuD+8ABWyitJniEAI9zJpbQnWojtqCLeVtBTxW3tg6hE5OjUySzLE1lg==
X-Received: by 2002:a17:902:c406:b0:1b6:783d:9ba7 with SMTP id
 k6-20020a170902c40600b001b6783d9ba7mr8807226plk.27.1688228533345; 
 Sat, 01 Jul 2023 09:22:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170902740c00b001b6674b6140sm12524647pll.290.2023.07.01.09.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 09:22:12 -0700 (PDT)
Message-ID: <0025db66-545d-c52b-1c32-fa86e17ff0e7@roeck-us.net>
Date: Sat, 1 Jul 2023 09:22:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
 <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
 <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 7/1/23 09:08, Doug Anderson wrote: > Hi, > > On Sat, Jul
    1, 2023 at 7:40 AM Guenter Roeck <linux@roeck-us.net> wrote: >> >> On Fri,
    Jun 16, 2023 at 05:06:18PM +0200, Petr Mladek wrote: >>> The HA [...] 
 
 Content analysis details:   (-1.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [groeck7[at]gmail.com]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [groeck7[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.214.171 listed in wl.mailspike.net]
  0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qFdMZ-003Ata-5E
X-Mailman-Approved-At: Mon, 03 Jul 2023 16:08:08 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v2 6/6] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gNy8xLzIzIDA5OjA4LCBEb3VnIEFuZGVyc29uIHdyb3RlOgo+IEhpLAo+IAo+IE9uIFNhdCwg
SnVsIDEsIDIwMjMgYXQgNzo0MOKAr0FNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5l
dD4gd3JvdGU6Cj4+Cj4+IE9uIEZyaSwgSnVuIDE2LCAyMDIzIGF0IDA1OjA2OjE4UE0gKzAyMDAs
IFBldHIgTWxhZGVrIHdyb3RlOgo+Pj4gVGhlIEhBVkVfIHByZWZpeCBtZWFucyB0aGF0IHRoZSBj
b2RlIGNvdWxkIGJlIGVuYWJsZWQuIEFkZCBhbm90aGVyCj4+PiB2YXJpYWJsZSBmb3IgSEFWRV9I
QVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggd2l0aG91dCB0aGlzIHByZWZpeC4KPj4+IEl0IHdpbGwg
YmUgc2V0IHdoZW4gaXQgc2hvdWxkIGJlIGJ1aWx0LiBJdCB3aWxsIG1ha2UgaXQgY29tcGF0aWJs
ZQo+Pj4gd2l0aCB0aGUgb3RoZXIgaGFyZGxvY2t1cCBkZXRlY3RvcnMuCj4+Pgo+Pj4gVGhlIGNo
YW5nZSBhbGxvd3MgdG8gY2xlYW4gdXAgZGVwZW5kZW5jaWVzIG9mIFBQQ19XQVRDSERPRwo+Pj4g
YW5kIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGIGRlZmluaXRpb25zIGZvciBwb3dlcnBj
Lgo+Pj4KPj4+IEFzIGEgcmVzdWx0IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGIGhhcyB0
aGUgc2FtZSBkZXBlbmRlbmNpZXMKPj4+IG9uIGFybSwgeDg2LCBwb3dlcnBjIGFyY2hpdGVjdHVy
ZXMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+
Cj4+PiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3Jn
Pgo+Pj4gLS0tCj4+IC4uLgo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9ubWkuaAo+Pj4gKysrIGIv
aW5jbHVkZS9saW51eC9ubWkuaAo+Pj4gQEAgLTksNyArOSw3IEBACj4+PiAgICNpbmNsdWRlIDxh
c20vaXJxLmg+Cj4+Pgo+Pj4gICAvKiBBcmNoIHNwZWNpZmljIHdhdGNoZG9ncyBtaWdodCBuZWVk
IHRvIHNoYXJlIGV4dHJhIHdhdGNoZG9nLXJlbGF0ZWQgQVBJcy4gKi8KPj4+IC0jaWYgZGVmaW5l
ZChDT05GSUdfSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0gpIHx8IGRlZmluZWQoQ09ORklH
X0hBUkRMT0NLVVBfREVURUNUT1JfU1BBUkM2NCkKPj4+ICsjaWYgZGVmaW5lZChDT05GSUdfSEFS
RExPQ0tVUF9ERVRFQ1RPUl9BUkNIKSB8fCBkZWZpbmVkKENPTkZJR19IQVJETE9DS1VQX0RFVEVD
VE9SX1NQQVJDNjQpCj4+Cj4+IFRoaXMgcmVzdWx0cyBpbjoKPj4KPj4gYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9wc2VyaWVzL21vYmlsaXR5LmM6IEluIGZ1bmN0aW9uICdwc2VyaWVzX21pZ3JhdGVf
cGFydGl0aW9uJzoKPj4gYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL21vYmlsaXR5LmM6
NzUzOjE3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3dhdGNoZG9n
X2hhcmRsb2NrdXBfc2V0X3RpbWVvdXRfcGN0JzsgZGlkIHlvdSBtZWFuICd3YXRjaGRvZ19oYXJk
bG9ja3VwX3N0b3AnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPj4g
ICAgNzUzIHwgICAgICAgICAgICAgICAgIHdhdGNoZG9nX2hhcmRsb2NrdXBfc2V0X3RpbWVvdXRf
cGN0KGZhY3Rvcik7Cj4+Cj4+IHdpdGggcHBjNjRfZGVmY29uZmlnIC1DT05GSUdfSEFSRExPQ0tV
UF9ERVRFQ1RPUiwgYmVjYXVzZSB0aGUgZHVtbXkKPj4gZm9yIHdhdGNoZG9nX2hhcmRsb2NrdXBf
c2V0X3RpbWVvdXRfcGN0KCkgaXMgc3RpbGwgZGVmaW5lZCBpbgo+PiBhcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vbm1pLmggd2hpY2ggaXMgbm8gbG9uZ2VyIGluY2x1ZGVkLgo+IAo+IENhbiB5b3Ug
dGVzdCB3aXRoOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA2MjkxMjQ1MDAu
MS5JNTVlMmY0ZTc5MDNkNjg2YzQ0ODRjYjIzYzAzM2M2YTllMWE5ZDRjNEBjaGFuZ2VpZAo+IAoK
QWgsIEkgZGlkbid0IGZpbmQgdGhhdCBvbmUuIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpZZXMsIHRo
YXQgc2hvdWxkIHdvcmsuIEl0IGlzIGEgYml0IG9kZCB0aGF0IGluY2x1ZGluZyBib3RoIGxpbnV4
L25taS5oCmFuZCBhc20vbm1pLmggaXMgcmVxdWlyZWQsIGJ1dCBhcyBpdCB0dXJucyBvdXQgdGhh
dCBpcyBhY3R1YWxseSBxdWl0ZSBjb21tb24uCgpUaGFua3MsCkd1ZW50ZXIKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFp
bGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
